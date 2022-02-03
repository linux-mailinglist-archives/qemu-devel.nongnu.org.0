Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4668F4A8C25
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 20:04:47 +0100 (CET)
Received: from localhost ([::1]:38612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFhPR-0001EG-So
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 14:04:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nFgUm-0002h6-SL
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 13:06:16 -0500
Received: from [2a00:1450:4864:20::334] (port=40595
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nFgUk-0007wv-S5
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 13:06:12 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 l129-20020a1c2587000000b0035394fedf14so7658982wml.5
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 10:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=idfuRv3ANeMu0bLv83Zpsx8JzsbUbRECinkwJcPZ084=;
 b=FRRzFXZyhJWxh+Nzl3Bnijt0BV3t0rbqVG2+zoixg7cmnujKPXRdxSiMLjLoNY57qA
 LYE1xH1LJ/Dwu1XyyTWwHBSxWMbEEenF8Xn7Ji7qdIo2YgavOVoM3Ziz0hPxMTiltqgl
 ukxcUvyJo8kVgm5yl6Bh0WqFUpjyKQDNC5dst/dLNp21GGBV+HvOm2Gk9QTl3tpe3R2V
 omX0n/fc201kumvafKS7Nfgyq3llC2yq7O4GCSn86R8zDegbNtOv495p28dtsIj6yLd8
 AfeHSqvZvwmHa1SQrZ3VpuajzC5Jo+ozBWd/lZXrZVyqRSzYHoS1YXomMKNlutoVthT0
 yb4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=idfuRv3ANeMu0bLv83Zpsx8JzsbUbRECinkwJcPZ084=;
 b=PKpqA889TsObQKOC4U/oBeJb43m4vZklLnl8lpjXiCCB65xdtsKkXldrG+ZTqsxXX0
 5XUuNXcGHGmMTVL4nEbLLmrbnBRm7YX3tGD976G2oX0kA/R6JiEsQMdW+WaeGsUpSSdF
 2snW8EIzlED29xxUmzu3bHBDtBjgIWgvSaWjaiNHzCWRBVA+kIIJVulMEtii/jUvTmxG
 vB8liSO3XBdIwaszBd5hfSK0HQR48U+skFQsqNd3t73StUQrjByQOVHAq/O3zHGSwRiL
 TEDrOU1HNuGota8d9NxTEnpN+00Llh7MJmSdJIom4udWcWitvYGnw8V0HctHU4DuAJWT
 BEiQ==
X-Gm-Message-State: AOAM533os/aNLk2n2k6u/88ndSXd2MS2GzbToqLamX7+gUVqk8kP/2xm
 mRNF9WTuJJmooiu6ScXhIBvymlsKTYA0/tYJrDU=
X-Google-Smtp-Source: ABdhPJzzkErnhB7mly4UI9WsDtY82c9CdvQQHxIMIffdCENtuOD3rl6zkevdfmmnWMCKU4HAwLHqCIFC7Pc32sASUtU=
X-Received: by 2002:a05:600c:4e46:: with SMTP id
 e6mr11239052wmq.15.1643911555732; 
 Thu, 03 Feb 2022 10:05:55 -0800 (PST)
MIME-Version: 1.0
References: <20220203165859.41066-1-f4bug@amsat.org>
In-Reply-To: <20220203165859.41066-1-f4bug@amsat.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 3 Feb 2022 22:05:43 +0400
Message-ID: <CAJ+F1CKgWg6rZMGHnvg_hX+7m-YXG7fCpVbTHPpCw0MoRE6c0Q@mail.gmail.com>
Subject: Re: [PATCH] audio/dbus: Fix building with modules enabled on macOS
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000052576405d720fcee"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x334.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000052576405d720fcee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Feb 3, 2022 at 9:04 PM Philippe Mathieu-Daud=C3=A9 via <
qemu-devel@nongnu.org> wrote:

> When configuring QEMU with --enable-modules we get on macOS:
>
>   --- stderr ---
>   Dependency ui-dbus cannot be satisfied
>
> ui-dbus depends on pixman and opengl, so add these dependencies
> to audio-dbus.
>

Weird, why would the audio module need pixman and opengl, on macos?


> Fixes: 739362d420 ("audio: add "dbus" audio backend")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  audio/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/audio/meson.build b/audio/meson.build
> index 0ac3791d0b..d9b295514f 100644
> --- a/audio/meson.build
> +++ b/audio/meson.build
> @@ -28,7 +28,7 @@ endforeach
>
>  if dbus_display
>      module_ss =3D ss.source_set()
> -    module_ss.add(when: gio, if_true: files('dbusaudio.c'))
> +    module_ss.add(when: [gio, pixman, opengl, 'CONFIG_GIO'], if_true:
> files('dbusaudio.c'))
>      audio_modules +=3D {'dbus': module_ss}
>  endif
>
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000052576405d720fcee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 3, 2022 at 9:04 PM Phil=
ippe Mathieu-Daud=C3=A9 via &lt;<a href=3D"mailto:qemu-devel@nongnu.org">qe=
mu-devel@nongnu.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">When configuring QEMU with --enable-modules we get on ma=
cOS:<br>
<br>
=C2=A0 --- stderr ---<br>
=C2=A0 Dependency ui-dbus cannot be satisfied<br>
<br>
ui-dbus depends on pixman and opengl, so add these dependencies<br>
to audio-dbus.<br></blockquote><div><br></div><div>Weird, why would the aud=
io module need pixman and opengl, on macos?</div><div><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
Fixes: 739362d420 (&quot;audio: add &quot;dbus&quot; audio backend&quot;)<b=
r>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0audio/meson.build | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/audio/meson.build b/audio/meson.build<br>
index 0ac3791d0b..d9b295514f 100644<br>
--- a/audio/meson.build<br>
+++ b/audio/meson.build<br>
@@ -28,7 +28,7 @@ endforeach<br>
<br>
=C2=A0if dbus_display<br>
=C2=A0 =C2=A0 =C2=A0module_ss =3D ss.source_set()<br>
-=C2=A0 =C2=A0 module_ss.add(when: gio, if_true: files(&#39;dbusaudio.c&#39=
;))<br>
+=C2=A0 =C2=A0 module_ss.add(when: [gio, pixman, opengl, &#39;CONFIG_GIO&#3=
9;], if_true: files(&#39;dbusaudio.c&#39;))<br>
=C2=A0 =C2=A0 =C2=A0audio_modules +=3D {&#39;dbus&#39;: module_ss}<br>
=C2=A0endif<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000052576405d720fcee--

