Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B6A425DC6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:44:25 +0200 (CEST)
Received: from localhost ([::1]:60076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYaFc-0007QG-6S
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaD4-0004cE-EF
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:41:46 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaD2-0005lT-N3
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:41:46 -0400
Received: by mail-wr1-x433.google.com with SMTP id s15so22928440wrv.11
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 13:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bj73rBD9ayCjQXjXHbefp/qKoW99F+eZx5bwwRLCTY8=;
 b=lhb/cSasr7jqoI9VxcXZ7LCJR/W8rHO6HRcjXFdnxSB0pIB8aX/4oKBhWfKP34HIe1
 fNOYjpONxWpGHIGoAPQhzbi80eA0tpNoCcX8I+1erZgYVY2e+wMmit9+hLyQ30fgmecH
 uDzbJwrVT3QDK7RPJ+YVC4TlCTO9jZbUMq1kjVrS5000ERxvAVPjJy2qHJsKHTeBLTai
 b6mZNu3GRaCFoAHFfu7OnC/2VHsgSXN4W+upebScbbCC7AntD4TamKG/9isNmBlESTcc
 S+1gJwOSu1yPyh2mVu5j8ZMFGQhVlNhkGjxU2AIValT6WMwKv+twpbhcGO53Bv9wZh7G
 37Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bj73rBD9ayCjQXjXHbefp/qKoW99F+eZx5bwwRLCTY8=;
 b=M4ixWPiun3otl06Urc13HWQKnRDkK2D3hPrFXOAPgcfFRl9bU3Nzm2dyL1CDfHY7fT
 eO/zOAEp8gRBRDs3Qjy5c7SjYIpuZUsUiuqZIYLBXsFEBxxtBMi/oTc3Ko2rB6iDH9BU
 /IoRmj3Ictnub+oGLFyrpfT48Bb1aJB7fjo+8azc3dFiZ3TfXRKLt5ihzyvoIzXuXzCk
 hQedzGp2BeI6PB/tyQiG2ABue1zsb1O3BX0hhhAnW6imyMIHfkioB9cWgF1FtDhiU26q
 amsAjCszwQo+DkgxCZVkoAsllx0XbKSSVlJFI1HBwy4A05pElZh3WkRwPXfbSAljVbey
 ISlg==
X-Gm-Message-State: AOAM530A1CaBGvN5Lco5iJlGciz3sMMq5ZMx8xrdoiKpjHll/EiYqmQs
 Tb+efI3SpU5rbgyxSFXx/5s9SPez6uZlCkm4nmU=
X-Google-Smtp-Source: ABdhPJyu8jEdNO+XIdtfKmR6iPLDIOKH//sxV+VUla8Ycw1Vmn5Lh75WCCxCV9jeVnhRlxTTN7oMI9XugB7gP6QqpQE=
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr7255640wmh.140.1633639303322; 
 Thu, 07 Oct 2021 13:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130829.632254-14-pbonzini@redhat.com>
In-Reply-To: <20211007130829.632254-14-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 8 Oct 2021 00:41:28 +0400
Message-ID: <CAJ+F1CJw2xARAcZr9Nc7jExTaoMta8zN3CHVcL9TAhBVKA4oEg@mail.gmail.com>
Subject: Re: [PATCH 19/24] configure: remove obsolete Solaris ar check
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000005da27e05cdc94a30"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x433.google.com
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

--0000000000005da27e05cdc94a30
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 7, 2021 at 5:17 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Meson already has its own logic to find the "ar" binary, so remove the
> Solaris specific check.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  configure | 15 ---------------
>  1 file changed, 15 deletions(-)
>
> diff --git a/configure b/configure
> index 016814d23b..2091844ad6 100755
> --- a/configure
> +++ b/configure
> @@ -2284,21 +2284,6 @@ EOF
>    fi
>  fi
>
> -#########################################
> -# Solaris specific configure tool chain decisions
> -
> -if test "$solaris" =3D "yes" ; then
> -  if has ar; then
> -    :
> -  else
> -    if test -f /usr/ccs/bin/ar ; then
> -      error_exit "No path includes ar" \
> -          "Add /usr/ccs/bin to your path and rerun configure"
> -    fi
> -    error_exit "No path includes ar"
> -  fi
> -fi
> -
>  if test "$tcg" =3D "enabled"; then
>      git_submodules=3D"$git_submodules tests/fp/berkeley-testfloat-3"
>      git_submodules=3D"$git_submodules tests/fp/berkeley-softfloat-3"
> --
> 2.31.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000005da27e05cdc94a30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 7, 2021 at 5:17 PM Paolo =
Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank">pbonzi=
ni@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Meson already has its own logic to find the &quot;ar&quot; bin=
ary, so remove the<br>
Solaris specific check.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandr=
e.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<=
/div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure | 15 ---------------<br>
=C2=A01 file changed, 15 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 016814d23b..2091844ad6 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -2284,21 +2284,6 @@ EOF<br>
=C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
<br>
-#########################################<br>
-# Solaris specific configure tool chain decisions<br>
-<br>
-if test &quot;$solaris&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 if has ar; then<br>
-=C2=A0 =C2=A0 :<br>
-=C2=A0 else<br>
-=C2=A0 =C2=A0 if test -f /usr/ccs/bin/ar ; then<br>
-=C2=A0 =C2=A0 =C2=A0 error_exit &quot;No path includes ar&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Add /usr/ccs/bin to your path and=
 rerun configure&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 error_exit &quot;No path includes ar&quot;<br>
-=C2=A0 fi<br>
-fi<br>
-<br>
=C2=A0if test &quot;$tcg&quot; =3D &quot;enabled&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0git_submodules=3D&quot;$git_submodules tests/fp/berkele=
y-testfloat-3&quot;<br>
=C2=A0 =C2=A0 =C2=A0git_submodules=3D&quot;$git_submodules tests/fp/berkele=
y-softfloat-3&quot;<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--0000000000005da27e05cdc94a30--

