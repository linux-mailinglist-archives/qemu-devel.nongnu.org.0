Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E5232EF0E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:39:11 +0100 (CET)
Received: from localhost ([::1]:47224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICXm-00049e-Nv
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:39:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lICGv-0004xA-Py
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:21:45 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:37607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lICGt-0004rM-QU
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:21:45 -0500
Received: by mail-ej1-x630.google.com with SMTP id bm21so4188471ejb.4
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 07:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6eoHoo1PqpSixK8yBSvysXxbRvflaDtqgg3F0Dw9Djk=;
 b=KjwCs+v9ot1ZBLLiloh3XQA0+DA+5Q5oo1//CGEvv/HJzOIN7ZXfRl47vhJKTSVPfl
 yuAF/Dywo5bDXOkGgLGJjqgIxygjtK/Y08vLNDKXP8joa2M68SgWI3/8XNFztDmRlG6n
 JJzSfuI01USwayHDAD1nmCOCHaysp2hVoHoYnB/EgKGHPA+QNYmBMfK5MnJ1aI5CJ8ok
 zH7E/kT0UG/cEXciCSHFjDymJMKaMJnw0VjP+8s4PR8V/wsm944gtR1O0i8yMgsEFL9/
 8l/3rp47Du6yYsNWM4MQ77oN5/UYLAF9kJAPQjidLgwPtpo3Z6Oy3LYseWbJ3ROz3KgQ
 UQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6eoHoo1PqpSixK8yBSvysXxbRvflaDtqgg3F0Dw9Djk=;
 b=naTe64lmDpeIdLxfzYg/tjIHSzey7xJrE/ckzbcSWcw0b7Wng1FbRwkPkCG/BhMoPO
 dklWSP2X97D9LOy9T5gM2JZZfiXL0e/ku3Yp/3AC+mLFhqXl5rDie9ngUs8vOn4nfeRJ
 LlANyInisulH9b22o31P6ZJ5RLXL06J2AVyGXTL8m6m0nrEkTKBsR0L+BoP3hY+po/vD
 dROWtcKJy4Eu9CabamTv9edS+MINXDox2i5zZj+3+Vo9sjGSTisLM8p7OigIAVivfc+u
 SK8C4iKUx4jr8MbBhrOGOwZ0uAoeXKNzRXn5Gn/zFYfd1fi23JG2LxkKaTHJ5vzlOVvV
 Z6iQ==
X-Gm-Message-State: AOAM530usOz3czJYC0YX1zRLEvGQRda7h9dG8yTvG82hZaXh76ayDEfr
 SJRV4M3K2uARwkHvl4cmIyEzQb4Tk4UKMStoET4=
X-Google-Smtp-Source: ABdhPJzanMV+gNi2kg/8uV/tVYMX0XadPUJKNbzKJUADeixFNODKpHkjRKIEZBGMTDZdOkng3xPsY1FT3GzOFLjZdkU=
X-Received: by 2002:a17:906:2bc2:: with SMTP id
 n2mr2560029ejg.381.1614957701897; 
 Fri, 05 Mar 2021 07:21:41 -0800 (PST)
MIME-Version: 1.0
References: <20210305144839.6558-1-alex.bennee@linaro.org>
In-Reply-To: <20210305144839.6558-1-alex.bennee@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 5 Mar 2021 19:21:29 +0400
Message-ID: <CAJ+F1C+hM=2EBOwKbedjp4Q6Qxd5=W7TTyZ3b=zns3fHQYsRZQ@mail.gmail.com>
Subject: Re: [RFC PATCH] .editorconfig: update the automatic mode setting for
 Emacs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000026204505bccba422"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x630.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000026204505bccba422
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Mar 5, 2021 at 6:49 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:

> It seems the editor specific keywords have been deprecated in the main
> editorconfig plugin:
>
>
> https://github.com/editorconfig/editorconfig-emacs#file-type-file_type_ex=
t-file_type_emacs
>
> Update the keywords to the suggested one and point users at the
> extension.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>

Right, today I had to make some emacs configuration changes related to
editorconfig & mode (editorconfig-file-type-emacs-whitelist no longer
exists).

Installed the editorconfig-custom-majormode.el and checked it worked.

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  .editorconfig | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/.editorconfig b/.editorconfig
> index 22681d91c6..22656e849d 100644
> --- a/.editorconfig
> +++ b/.editorconfig
> @@ -4,6 +4,11 @@
>  # plugin.
>  #
>  # Check https://editorconfig.org for details.
> +#
> +# Emacs: you need
> https://github.com/10sr/editorconfig-custom-majormode-el
> +# to automatically enable the appropriate major-mode for your files
> +# that aren't already caught by your exiting config.
> +#
>
>  root =3D true
>
> @@ -15,17 +20,17 @@ charset =3D utf-8
>  [*.mak]
>  indent_style =3D tab
>  indent_size =3D 8
> -file_type_emacs =3D makefile
> +emacs_mode =3D makefile
>
>  [Makefile*]
>  indent_style =3D tab
>  indent_size =3D 8
> -file_type_emacs =3D makefile
> +emacs_mode =3D makefile
>
>  [*.{c,h,c.inc,h.inc}]
>  indent_style =3D space
>  indent_size =3D 4
> -file_type_emacs =3D c
> +emacs_mode =3D c
>
>  [*.sh]
>  indent_style =3D space
> @@ -34,11 +39,11 @@ indent_size =3D 4
>  [*.{s,S}]
>  indent_style =3D tab
>  indent_size =3D 8
> -file_type_emacs =3D asm
> +emacs_mode =3D asm
>
>  [*.{vert,frag}]
> -file_type_emacs =3D glsl
> +emacs_mode =3D glsl
>
>  [*.json]
>  indent_style =3D space
> -file_type_emacs =3D python
> +emacs_mode =3D python
> --
> 2.20.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000026204505bccba422
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 5, 2021 at 6:49 PM Alex=
 Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">It seems the editor specific keywords have been deprecated in the mai=
n<br>
editorconfig plugin:<br>
<br>
=C2=A0 <a href=3D"https://github.com/editorconfig/editorconfig-emacs#file-t=
ype-file_type_ext-file_type_emacs" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/editorconfig/editorconfig-emacs#file-type-file_type_ext-fil=
e_type_emacs</a><br>
<br>
Update the keywords to the suggested one and point users at the<br>
extension.<br>
<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
Cc: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.co=
m" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br></blockquote><d=
iv><br></div><div>Right, today I had to make some emacs configuration chang=
es related to editorconfig &amp; mode (editorconfig-file-type-emacs-whiteli=
st no longer exists).</div><div><br></div><div>Installed the editorconfig-c=
ustom-majormode.el and checked it worked.</div><div><br></div><div> Reviewe=
d-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.=
com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;</div><div> <br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0.editorconfig | 17 +++++++++++------<br>
=C2=A01 file changed, 11 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/.editorconfig b/.editorconfig<br>
index 22681d91c6..22656e849d 100644<br>
--- a/.editorconfig<br>
+++ b/.editorconfig<br>
@@ -4,6 +4,11 @@<br>
=C2=A0# plugin.<br>
=C2=A0#<br>
=C2=A0# Check <a href=3D"https://editorconfig.org" rel=3D"noreferrer" targe=
t=3D"_blank">https://editorconfig.org</a> for details.<br>
+#<br>
+# Emacs: you need <a href=3D"https://github.com/10sr/editorconfig-custom-m=
ajormode-el" rel=3D"noreferrer" target=3D"_blank">https://github.com/10sr/e=
ditorconfig-custom-majormode-el</a><br>
+# to automatically enable the appropriate major-mode for your files<br>
+# that aren&#39;t already caught by your exiting config.<br>
+#<br>
<br>
=C2=A0root =3D true<br>
<br>
@@ -15,17 +20,17 @@ charset =3D utf-8<br>
=C2=A0[*.mak]<br>
=C2=A0indent_style =3D tab<br>
=C2=A0indent_size =3D 8<br>
-file_type_emacs =3D makefile<br>
+emacs_mode =3D makefile<br>
<br>
=C2=A0[Makefile*]<br>
=C2=A0indent_style =3D tab<br>
=C2=A0indent_size =3D 8<br>
-file_type_emacs =3D makefile<br>
+emacs_mode =3D makefile<br>
<br>
=C2=A0[*.{c,h,c.inc,h.inc}]<br>
=C2=A0indent_style =3D space<br>
=C2=A0indent_size =3D 4<br>
-file_type_emacs =3D c<br>
+emacs_mode =3D c<br>
<br>
=C2=A0[*.sh]<br>
=C2=A0indent_style =3D space<br>
@@ -34,11 +39,11 @@ indent_size =3D 4<br>
=C2=A0[*.{s,S}]<br>
=C2=A0indent_style =3D tab<br>
=C2=A0indent_size =3D 8<br>
-file_type_emacs =3D asm<br>
+emacs_mode =3D asm<br>
<br>
=C2=A0[*.{vert,frag}]<br>
-file_type_emacs =3D glsl<br>
+emacs_mode =3D glsl<br>
<br>
=C2=A0[*.json]<br>
=C2=A0indent_style =3D space<br>
-file_type_emacs =3D python<br>
+emacs_mode =3D python<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000026204505bccba422--

