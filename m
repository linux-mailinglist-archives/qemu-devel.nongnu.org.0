Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D63B373DBC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 16:35:26 +0200 (CEST)
Received: from localhost ([::1]:45208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leIcX-0005Wr-N8
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 10:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1leIY8-0002sa-El
 for qemu-devel@nongnu.org; Wed, 05 May 2021 10:30:52 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:45679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1leIY4-0007mX-Tn
 for qemu-devel@nongnu.org; Wed, 05 May 2021 10:30:51 -0400
Received: by mail-ed1-x535.google.com with SMTP id d14so2274931edc.12
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 07:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rA7hRW1JBNkCAiU7zHN+36Igaw6vYXaicTm27S2KSck=;
 b=TbiEhLH/xLfvJYV+bfgLnW0vsVyb1uuElScOk+6QQRXg9154RjCByIE2mrf28C4aZR
 yMiCYZjiWgvgZs32zuH0SuTJuPxW1md5DGXVN2tNYwb+8ulmh/GPMooLkGYW9r+ax24o
 Fv6HcnFWL3lkl97jGVwpe1Mrm95ZlBPCWe2SF7r+NLo41zY11/ysoUUA6ArAftvPqcMM
 yNRSg93QS6RR7ZY/mzKDSEnrrOajqKZ8QEFjSIQmUzYJlZsILiAry+CpOJAh4dW7xPj+
 pcJznJFNDse3HZYM0mD9FQ9woMAauitLw0yFnI0v8Q+sLwreSfa3Ujcc7Yd8CPY0L9hZ
 Stfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rA7hRW1JBNkCAiU7zHN+36Igaw6vYXaicTm27S2KSck=;
 b=H1JznniGZqdFdweFj1wt0Cl0nS4g/dYMcOLR9RGUXNfs78u6KH+kL8GJFZ7nXHy6N5
 q5JUhnObf76rZ93729POov1sl37b2tsO+XFpqh+75QQKXfel0QGhdOsWQ622BPhFVszT
 LrFAuxSNlzApZrPBoLXoef/H5oKRmgY6/1kvxn7/57SwJbbnIl2EAvQx+BOOiDtsKIz1
 /fyMmwJJeh0oHs+6X3X3SozcjdrwByLzLNB45DtSh0e5gkSpAGi9+sIfHfiq4I5ydkDy
 IjgFfWhUDeD0kFrjkbsn3EMhVXalDRHSKo/QYu/VoNMehdUvI1O9q4tvNB7x8m6Uycah
 BdTg==
X-Gm-Message-State: AOAM531WDusS/BMuzlIx5NMqUv4T6NLoNTGnr1qQoPYUOhx83I7s1Zg/
 QYFCdcQGet9fdfmyt+QB++8bT5ZN6NmkVqe7fMQ=
X-Google-Smtp-Source: ABdhPJyLpYzFei2ezJHxa/meKwCxllNuck9EcPda6NircVZpg1lrnb/SzcuGt1ThLZCTFTdvKCHTHIeMwxGlYpZQ3K0=
X-Received: by 2002:a05:6402:34c5:: with SMTP id
 w5mr11274721edc.237.1620225047129; 
 Wed, 05 May 2021 07:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210505142412.705817-1-pbonzini@redhat.com>
In-Reply-To: <20210505142412.705817-1-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 5 May 2021 18:30:35 +0400
Message-ID: <CAJ+F1C+NftUfMycYikOE2aij_weim7yQiuK1MVfLThqc5d6tYg@mail.gmail.com>
Subject: Re: [PATCH] configure: fix detection of gdbus-codegen
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000063f28e05c1960a25"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, Sebastian Mitterle <smitterl@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, elmarco@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000063f28e05c1960a25
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 5, 2021 at 6:25 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> "pkg-config --variable=3Dgdbus_codegen gio-2.0" returns "gdbus-codegen",
> and it does not pass test -x (which does not walk the path).
>
> Meson 0.58.0 notices that something is iffy, as the dbus_vmstate1
> assignment in tests/qtest/meson.build uses an empty string as the
> command, and fails very eloquently:
>
> ../tests/qtest/meson.build:92:2: ERROR: No program name specified.
>
> Use the "has" function instead of test -x, and fix the generation
> of config-host.mak since meson.build expects that GDBUS_CODEGEN
> is absent, rather than empty, if the tool is unavailable.
>
> Reported-by: Sebastian Mitterle <smitterl@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Resolves:
https://gitlab.com/qemu-project/qemu/-/issues/178

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  configure | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/configure b/configure
> index 54f8475444..5877a6b2bf 100755
> --- a/configure
> +++ b/configure
> @@ -3341,7 +3341,7 @@ if ! test "$gio" =3D "no"; then
>          gio_cflags=3D$($pkg_config --cflags gio-2.0)
>          gio_libs=3D$($pkg_config --libs gio-2.0)
>          gdbus_codegen=3D$($pkg_config --variable=3Dgdbus_codegen gio-2.0=
)
> -        if [ ! -x "$gdbus_codegen" ]; then
> +        if ! has "$gdbus_codegen"; then
>              gdbus_codegen=3D
>          fi
>          # Check that the libraries actually work -- Ubuntu 18.04 ships
> @@ -5704,6 +5704,8 @@ if test "$gio" =3D "yes" ; then
>      echo "CONFIG_GIO=3Dy" >> $config_host_mak
>      echo "GIO_CFLAGS=3D$gio_cflags" >> $config_host_mak
>      echo "GIO_LIBS=3D$gio_libs" >> $config_host_mak
> +fi
> +if test "$gdbus_codegen" !=3D "" ; then
>      echo "GDBUS_CODEGEN=3D$gdbus_codegen" >> $config_host_mak
>  fi
>  echo "CONFIG_TLS_PRIORITY=3D\"$tls_priority\"" >> $config_host_mak
> --
> 2.26.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000063f28e05c1960a25
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 5, 2021 at 6:25 PM Paolo =
Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&quot=
;pkg-config --variable=3Dgdbus_codegen gio-2.0&quot; returns &quot;gdbus-co=
degen&quot;,<br>
and it does not pass test -x (which does not walk the path).<br>
<br>
Meson 0.58.0 notices that something is iffy, as the dbus_vmstate1<br>
assignment in tests/qtest/meson.build uses an empty string as the<br>
command, and fails very eloquently:<br>
<br>
../tests/qtest/meson.build:92:2: ERROR: No program name specified.<br>
<br>
Use the &quot;has&quot; function instead of test -x, and fix the generation=
<br>
of config-host.mak since meson.build expects that GDBUS_CODEGEN<br>
is absent, rather than empty, if the tool is unavailable.<br>
<br>
Reported-by: Sebastian Mitterle &lt;<a href=3D"mailto:smitterl@redhat.com" =
target=3D"_blank">smitterl@redhat.com</a>&gt;<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Resolves:<br></div><div><a href=3D"https://gitlab.com/qemu-project/qemu=
/-/issues/178">https://gitlab.com/qemu-project/qemu/-/issues/178</a></div><=
div><br> </div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mail=
to:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><d=
iv><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/configure b/configure<br>
index 54f8475444..5877a6b2bf 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -3341,7 +3341,7 @@ if ! test &quot;$gio&quot; =3D &quot;no&quot;; then<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gio_cflags=3D$($pkg_config --cflags gio-2=
.0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gio_libs=3D$($pkg_config --libs gio-2.0)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gdbus_codegen=3D$($pkg_config --variable=
=3Dgdbus_codegen gio-2.0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ! -x &quot;$gdbus_codegen&quot; ]; then<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ! has &quot;$gdbus_codegen&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gdbus_codegen=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Check that the libraries actually work =
-- Ubuntu 18.04 ships<br>
@@ -5704,6 +5704,8 @@ if test &quot;$gio&quot; =3D &quot;yes&quot; ; then<b=
r>
=C2=A0 =C2=A0 =C2=A0echo &quot;CONFIG_GIO=3Dy&quot; &gt;&gt; $config_host_m=
ak<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;GIO_CFLAGS=3D$gio_cflags&quot; &gt;&gt; $con=
fig_host_mak<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;GIO_LIBS=3D$gio_libs&quot; &gt;&gt; $config_=
host_mak<br>
+fi<br>
+if test &quot;$gdbus_codegen&quot; !=3D &quot;&quot; ; then<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;GDBUS_CODEGEN=3D$gdbus_codegen&quot; &gt;&gt=
; $config_host_mak<br>
=C2=A0fi<br>
=C2=A0echo &quot;CONFIG_TLS_PRIORITY=3D\&quot;$tls_priority\&quot;&quot; &g=
t;&gt; $config_host_mak<br>
-- <br>
2.26.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000063f28e05c1960a25--

