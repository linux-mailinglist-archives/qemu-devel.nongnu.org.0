Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 797EB513C12
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 21:19:38 +0200 (CEST)
Received: from localhost ([::1]:55656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk9ft-0006yo-43
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 15:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nk9eD-0005xT-L3
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 15:17:53 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:41550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nk9eB-00059h-Rh
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 15:17:53 -0400
Received: by mail-qt1-x831.google.com with SMTP id y3so4214292qtn.8
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 12:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tKf/brwfBIuwbzScKtlIbnWD5yUW1Fd6Fk4l2PfOR5Q=;
 b=P11U5q68Yjm3NfbvtWNVx7r6wpFQMHuRnZUqCyVGD9+VvCc3B9alxKccvLgXIDs0ol
 Ra0Pl6PEShm6/fGY7ojF0nKLbUb9LtiFBWFHobDOy8F1+xKy0azfFtGHVq/ECnFBFvD1
 DF5txEi/m6fJaU/MmdOOfYH8Z5d1uF90tIp4gUQitKYzNaj45CFqZhjZoZfpTvIx8g4P
 PKTCkDcAzSaqAc+r69ttKmOWVE1srBgdMpJQhsY6xiILa5vOd72eJG1ulh/VKuztOmSS
 y0eWUlN2gxEBJwcu55CVucHmaLLFTMSJxaBKG4pTO0BFLb/bBsGk8pQXLZMsaTfLMWU0
 l9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tKf/brwfBIuwbzScKtlIbnWD5yUW1Fd6Fk4l2PfOR5Q=;
 b=Q6Ci6Hn5qK/F32Tyn/hnWDM+bEq0KkrwwRwKITsBjb+bYr1PfbHuE0RQbB8sVAVHIM
 jWzwmitA/RfR2o55S+gGtNjr6AlIk7yBuMEAMau5/KwOEabi04sHI7cQQjiEJ2S6naL9
 b+WjbdxQHnCEFUIeTmKjc8dre5HoFOH8m2jiPQKohbYguhQQIUEiqNWGwgX3yTa184fe
 WuDOBka99RGIIXbEFxyqsDXFfCJvPZeJ/Yo+pB+6A139YMljYGLCUq/5bPgvegNH4w1F
 jKOJ/SvboOrw3u1sCrZ3PlXVi7LZLGX+uOpA3SWuTSo2ZvDg0DBEZjMbqViv+XnphJYn
 Sd4Q==
X-Gm-Message-State: AOAM530gTzWh3zHH4gjZDFX68JlwFTWWyqrsUcl2ArMJdNoNTThF+Tpy
 RkdgbLtgx2Ul6AS6t+vfuDANvDEsQhOwOQgID2c=
X-Google-Smtp-Source: ABdhPJzZ69SeZESg5cfwectnlxKjeYHJa+0Fv1zsSayjyEMQf5j10G0qs+OLSgiZ8Hs8Vp4wk1adADvvYveycrQfglA=
X-Received: by 2002:a05:622a:2c5:b0:2f3:6354:28e2 with SMTP id
 a5-20020a05622a02c500b002f3635428e2mr18354029qtx.560.1651173470399; Thu, 28
 Apr 2022 12:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220428181525.300521-1-kkostiuk@redhat.com>
In-Reply-To: <20220428181525.300521-1-kkostiuk@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 28 Apr 2022 23:17:39 +0400
Message-ID: <CAJ+F1CJT3Yy6k1iJmDL15Tnh+n5G0vnfsbHMTQYCv2S20CHnOg@mail.gmail.com>
Subject: Re: [PATCH 1/2] configure: Add cross prefix for widl tool
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000002a709605ddbbc8cb"
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002a709605ddbbc8cb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2022 at 10:17 PM Konstantin Kostiuk <kkostiuk@redhat.com>
wrote:

> The mingw-w64-tool package in Fedora provides widl tool with a
> cross prefix, so adds it automatically for cross builds.
>
> WIDL env can be used to redefine the path to tool.
> The same behavior as with windres.
>
> Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  configure | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/configure b/configure
> index 59c43bea05..8b775492d0 100755
> --- a/configure
> +++ b/configure
> @@ -415,6 +415,7 @@ ranlib=3D"${RANLIB-${cross_prefix}ranlib}"
>  nm=3D"${NM-${cross_prefix}nm}"
>  smbd=3D"$SMBD"
>  strip=3D"${STRIP-${cross_prefix}strip}"
> +widl=3D"${WIDL-${cross_prefix}widl}"
>  windres=3D"${WINDRES-${cross_prefix}windres}"
>  pkg_config_exe=3D"${PKG_CONFIG-${cross_prefix}pkg-config}"
>  query_pkg_config() {
> @@ -2786,6 +2787,7 @@ if test "$skip_meson" =3D no; then
>      echo "sdl2-config =3D [$(meson_quote $sdl2_config)]" >> $cross
>    fi
>    echo "strip =3D [$(meson_quote $strip)]" >> $cross
> +  echo "widl =3D [$(meson_quote $widl)]" >> $cross
>    echo "windres =3D [$(meson_quote $windres)]" >> $cross
>    if test "$cross_compile" =3D "yes"; then
>      cross_arg=3D"--cross-file config-meson.cross"
> @@ -2907,6 +2909,7 @@ preserve_env PYTHON
>  preserve_env SDL2_CONFIG
>  preserve_env SMBD
>  preserve_env STRIP
> +preserve_env WIDL
>  preserve_env WINDRES
>
>  printf "exec" >>config.status
> --
> 2.25.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000002a709605ddbbc8cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 28, 2022 at 10:17 PM Kons=
tantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redhat.com">kkostiuk@redhat.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">The mingw-w64-tool package in Fedora provides widl tool with a<br>
cross prefix, so adds it automatically for cross builds.<br>
<br>
WIDL env can be used to redefine the path to tool.<br>
The same behavior as with windres.<br>
<br>
Signed-off-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redhat.com=
" target=3D"_blank">kkostiuk@redhat.com</a>&gt;<br></blockquote><div><br></=
div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandr=
e.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/configure b/configure<br>
index 59c43bea05..8b775492d0 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -415,6 +415,7 @@ ranlib=3D&quot;${RANLIB-${cross_prefix}ranlib}&quot;<br=
>
=C2=A0nm=3D&quot;${NM-${cross_prefix}nm}&quot;<br>
=C2=A0smbd=3D&quot;$SMBD&quot;<br>
=C2=A0strip=3D&quot;${STRIP-${cross_prefix}strip}&quot;<br>
+widl=3D&quot;${WIDL-${cross_prefix}widl}&quot;<br>
=C2=A0windres=3D&quot;${WINDRES-${cross_prefix}windres}&quot;<br>
=C2=A0pkg_config_exe=3D&quot;${PKG_CONFIG-${cross_prefix}pkg-config}&quot;<=
br>
=C2=A0query_pkg_config() {<br>
@@ -2786,6 +2787,7 @@ if test &quot;$skip_meson&quot; =3D no; then<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;sdl2-config =3D [$(meson_quote $sdl2_config)=
]&quot; &gt;&gt; $cross<br>
=C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0echo &quot;strip =3D [$(meson_quote $strip)]&quot; &gt;&gt; $c=
ross<br>
+=C2=A0 echo &quot;widl =3D [$(meson_quote $widl)]&quot; &gt;&gt; $cross<br=
>
=C2=A0 =C2=A0echo &quot;windres =3D [$(meson_quote $windres)]&quot; &gt;&gt=
; $cross<br>
=C2=A0 =C2=A0if test &quot;$cross_compile&quot; =3D &quot;yes&quot;; then<b=
r>
=C2=A0 =C2=A0 =C2=A0cross_arg=3D&quot;--cross-file config-meson.cross&quot;=
<br>
@@ -2907,6 +2909,7 @@ preserve_env PYTHON<br>
=C2=A0preserve_env SDL2_CONFIG<br>
=C2=A0preserve_env SMBD<br>
=C2=A0preserve_env STRIP<br>
+preserve_env WIDL<br>
=C2=A0preserve_env WINDRES<br>
<br>
=C2=A0printf &quot;exec&quot; &gt;&gt;config.status<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000002a709605ddbbc8cb--

