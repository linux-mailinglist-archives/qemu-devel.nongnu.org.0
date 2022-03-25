Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F584E73FF
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 14:12:43 +0100 (CET)
Received: from localhost ([::1]:54884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXjkA-0006QZ-QX
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 09:12:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nXjix-0005kA-E0
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 09:11:27 -0400
Received: from [2a00:1450:4864:20::333] (port=34578
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nXjiv-0000s9-0l
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 09:11:27 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 p26-20020a05600c1d9a00b0038ccbff1951so2839843wms.1
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 06:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4sFJegMtbcpFwP0xyQKC2Kz7WbBUQ9DX2RIN5mboQqc=;
 b=czeGNHniRcR7FKnYOnzgSXK58FUifEQzlxox9IVY4prOtj5i3HNKnAZVp5x6MyF5kW
 8JGjxOobaDGPdkXAQKXCRGBHlF9t7oZG41lobcybgQBbl6DUVEXXSNZIsHTI15PuAPVb
 djIWSQja83FWILPy02H5O+00qhBaAQ2OVGLH4JsOz91y6sgxpiYzEL1HYaTd+0dfhWAX
 pBTaw0h5J5X5+BviHYNH1H5d2SKIhJ4++GQbRqr51Bt18UqFQuV85m5fY6pM1/Cn9HCm
 5XGzNDYuZSi6a6nX06nr75NJhYez848yrZr5WZRmMLNyjeCIHOEF+OGl37G1r1ucKc3K
 jaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4sFJegMtbcpFwP0xyQKC2Kz7WbBUQ9DX2RIN5mboQqc=;
 b=1/XeLUeULT480AsrH4iraD+7Ogtdf39GV/SjuKSuikpFFgr3lOlCNy+jkuxjh8yaGw
 HdveBV7SFsO/CNQ3Jmljz30iXxPvwjVuwGBY/jgKFMJGEQVB9sv2wECUhE/7TwYnlfgn
 KdZmWUTCI0D75UCHasO9Em3ZZ56yaycmgeY3Y1Qohm+yjq9cUPTMUSnvRjEUyn523CNJ
 yazrh5ELvXGAOtcjhflF3o8HIeyXqrm57pD1C0OW4qWuZ2pz8KbsPEpqMVK+ajUDEcPN
 9sIBe2O9Q8j2wH0xaSl1FBygrJO0wGCWzGCs+UwNawwmoKmG2pE7tUR562kp7tHlU42S
 uCXg==
X-Gm-Message-State: AOAM531h4xgJOvY+MHveRPEDUQGQUwgIpZ1dC/xn/Uzn2xl0WYLpsSHK
 v46z7SeKnRm9Xz7O1AJUC90JwwYX2HEPi7KB67E=
X-Google-Smtp-Source: ABdhPJwq1BACWlR7I8wqKwQymNzY1PU82iexQYNbQ4zOWG3v4Tr2PGlkmBQYefL8SiqILcRwsnfJNKTRK5138J/GwIk=
X-Received: by 2002:a05:600c:2948:b0:38c:b3e5:eed3 with SMTP id
 n8-20020a05600c294800b0038cb3e5eed3mr19024312wmd.168.1648213883091; Fri, 25
 Mar 2022 06:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220325095134.68689-1-akihiko.odaki@gmail.com>
In-Reply-To: <20220325095134.68689-1-akihiko.odaki@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 25 Mar 2022 17:11:10 +0400
Message-ID: <CAJ+F1CKgsD5R4ZK7BQF4gAY1S2ty_nwiRGkwnqvaoS2ndGRuLQ@mail.gmail.com>
Subject: Re: [PATCH] ui/console: Check console before emitting GL event
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000003ff9505db0ab333"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
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

--00000000000003ff9505db0ab333
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Mar 25, 2022 at 1:53 PM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Akihiko, is this fixing a visible bug? If so, it would be nice you detail
it in the commit message and someone should queue it for 7.0

thanks


> ---
>  ui/console.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/ui/console.c b/ui/console.c
> index da434ce1b2f..1752f2ec889 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -1886,6 +1886,9 @@ void dpy_gl_scanout_disable(QemuConsole *con)
>          con->scanout.kind =3D SCANOUT_NONE;
>      }
>      QLIST_FOREACH(dcl, &s->listeners, next) {
> +        if (con !=3D (dcl->con ? dcl->con : active_console)) {
> +            continue;
> +        }
>          if (dcl->ops->dpy_gl_scanout_disable) {
>              dcl->ops->dpy_gl_scanout_disable(dcl);
>          }
> @@ -1909,6 +1912,9 @@ void dpy_gl_scanout_texture(QemuConsole *con,
>          x, y, width, height
>      };
>      QLIST_FOREACH(dcl, &s->listeners, next) {
> +        if (con !=3D (dcl->con ? dcl->con : active_console)) {
> +            continue;
> +        }
>          if (dcl->ops->dpy_gl_scanout_texture) {
>              dcl->ops->dpy_gl_scanout_texture(dcl, backing_id,
>                                               backing_y_0_top,
> @@ -1927,6 +1933,9 @@ void dpy_gl_scanout_dmabuf(QemuConsole *con,
>      con->scanout.kind =3D SCANOUT_DMABUF;
>      con->scanout.dmabuf =3D dmabuf;
>      QLIST_FOREACH(dcl, &s->listeners, next) {
> +        if (con !=3D (dcl->con ? dcl->con : active_console)) {
> +            continue;
> +        }
>          if (dcl->ops->dpy_gl_scanout_dmabuf) {
>              dcl->ops->dpy_gl_scanout_dmabuf(dcl, dmabuf);
>          }
> @@ -1940,6 +1949,9 @@ void dpy_gl_cursor_dmabuf(QemuConsole *con,
> QemuDmaBuf *dmabuf,
>      DisplayChangeListener *dcl;
>
>      QLIST_FOREACH(dcl, &s->listeners, next) {
> +        if (con !=3D (dcl->con ? dcl->con : active_console)) {
> +            continue;
> +        }
>          if (dcl->ops->dpy_gl_cursor_dmabuf) {
>              dcl->ops->dpy_gl_cursor_dmabuf(dcl, dmabuf,
>                                             have_hot, hot_x, hot_y);
> @@ -1954,6 +1966,9 @@ void dpy_gl_cursor_position(QemuConsole *con,
>      DisplayChangeListener *dcl;
>
>      QLIST_FOREACH(dcl, &s->listeners, next) {
> +        if (con !=3D (dcl->con ? dcl->con : active_console)) {
> +            continue;
> +        }
>          if (dcl->ops->dpy_gl_cursor_position) {
>              dcl->ops->dpy_gl_cursor_position(dcl, pos_x, pos_y);
>          }
> @@ -1967,6 +1982,9 @@ void dpy_gl_release_dmabuf(QemuConsole *con,
>      DisplayChangeListener *dcl;
>
>      QLIST_FOREACH(dcl, &s->listeners, next) {
> +        if (con !=3D (dcl->con ? dcl->con : active_console)) {
> +            continue;
> +        }
>          if (dcl->ops->dpy_gl_release_dmabuf) {
>              dcl->ops->dpy_gl_release_dmabuf(dcl, dmabuf);
>          }
> @@ -1983,6 +2001,9 @@ void dpy_gl_update(QemuConsole *con,
>
>      graphic_hw_gl_block(con, true);
>      QLIST_FOREACH(dcl, &s->listeners, next) {
> +        if (con !=3D (dcl->con ? dcl->con : active_console)) {
> +            continue;
> +        }
>          if (dcl->ops->dpy_gl_update) {
>              dcl->ops->dpy_gl_update(dcl, x, y, w, h);
>          }
> --
> 2.32.0 (Apple Git-132)
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000003ff9505db0ab333
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 25, 2022 at 1:53 PM Aki=
hiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">akihiko.odaki@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Signed-off-by: Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmai=
l.com" target=3D"_blank">akihiko.odaki@gmail.com</a>&gt;<br></blockquote><d=
iv><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto=
:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div=
><br></div><div>Akihiko, is this fixing a visible bug? If so, it would be n=
ice you detail it in the commit message and someone should queue it for 7.0=
</div><div><br></div><div>thanks</div><div>=C2=A0<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
---<br>
=C2=A0ui/console.c | 21 +++++++++++++++++++++<br>
=C2=A01 file changed, 21 insertions(+)<br>
<br>
diff --git a/ui/console.c b/ui/console.c<br>
index da434ce1b2f..1752f2ec889 100644<br>
--- a/ui/console.c<br>
+++ b/ui/console.c<br>
@@ -1886,6 +1886,9 @@ void dpy_gl_scanout_disable(QemuConsole *con)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0con-&gt;scanout.kind =3D SCANOUT_NONE;<br=
>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0QLIST_FOREACH(dcl, &amp;s-&gt;listeners, next) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (con !=3D (dcl-&gt;con ? dcl-&gt;con : acti=
ve_console)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dcl-&gt;ops-&gt;dpy_gl_scanout_disabl=
e) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dcl-&gt;ops-&gt;dpy_gl_scan=
out_disable(dcl);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -1909,6 +1912,9 @@ void dpy_gl_scanout_texture(QemuConsole *con,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0x, y, width, height<br>
=C2=A0 =C2=A0 =C2=A0};<br>
=C2=A0 =C2=A0 =C2=A0QLIST_FOREACH(dcl, &amp;s-&gt;listeners, next) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (con !=3D (dcl-&gt;con ? dcl-&gt;con : acti=
ve_console)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dcl-&gt;ops-&gt;dpy_gl_scanout_textur=
e) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dcl-&gt;ops-&gt;dpy_gl_scan=
out_texture(dcl, backing_id,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 backing_y_0_top,<br>
@@ -1927,6 +1933,9 @@ void dpy_gl_scanout_dmabuf(QemuConsole *con,<br>
=C2=A0 =C2=A0 =C2=A0con-&gt;scanout.kind =3D SCANOUT_DMABUF;<br>
=C2=A0 =C2=A0 =C2=A0con-&gt;scanout.dmabuf =3D dmabuf;<br>
=C2=A0 =C2=A0 =C2=A0QLIST_FOREACH(dcl, &amp;s-&gt;listeners, next) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (con !=3D (dcl-&gt;con ? dcl-&gt;con : acti=
ve_console)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dcl-&gt;ops-&gt;dpy_gl_scanout_dmabuf=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dcl-&gt;ops-&gt;dpy_gl_scan=
out_dmabuf(dcl, dmabuf);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -1940,6 +1949,9 @@ void dpy_gl_cursor_dmabuf(QemuConsole *con, QemuDmaBu=
f *dmabuf,<br>
=C2=A0 =C2=A0 =C2=A0DisplayChangeListener *dcl;<br>
<br>
=C2=A0 =C2=A0 =C2=A0QLIST_FOREACH(dcl, &amp;s-&gt;listeners, next) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (con !=3D (dcl-&gt;con ? dcl-&gt;con : acti=
ve_console)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dcl-&gt;ops-&gt;dpy_gl_cursor_dmabuf)=
 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dcl-&gt;ops-&gt;dpy_gl_curs=
or_dmabuf(dcl, dmabuf,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 have_hot, hot_x, hot_y);<br>
@@ -1954,6 +1966,9 @@ void dpy_gl_cursor_position(QemuConsole *con,<br>
=C2=A0 =C2=A0 =C2=A0DisplayChangeListener *dcl;<br>
<br>
=C2=A0 =C2=A0 =C2=A0QLIST_FOREACH(dcl, &amp;s-&gt;listeners, next) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (con !=3D (dcl-&gt;con ? dcl-&gt;con : acti=
ve_console)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dcl-&gt;ops-&gt;dpy_gl_cursor_positio=
n) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dcl-&gt;ops-&gt;dpy_gl_curs=
or_position(dcl, pos_x, pos_y);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -1967,6 +1982,9 @@ void dpy_gl_release_dmabuf(QemuConsole *con,<br>
=C2=A0 =C2=A0 =C2=A0DisplayChangeListener *dcl;<br>
<br>
=C2=A0 =C2=A0 =C2=A0QLIST_FOREACH(dcl, &amp;s-&gt;listeners, next) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (con !=3D (dcl-&gt;con ? dcl-&gt;con : acti=
ve_console)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dcl-&gt;ops-&gt;dpy_gl_release_dmabuf=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dcl-&gt;ops-&gt;dpy_gl_rele=
ase_dmabuf(dcl, dmabuf);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -1983,6 +2001,9 @@ void dpy_gl_update(QemuConsole *con,<br>
<br>
=C2=A0 =C2=A0 =C2=A0graphic_hw_gl_block(con, true);<br>
=C2=A0 =C2=A0 =C2=A0QLIST_FOREACH(dcl, &amp;s-&gt;listeners, next) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (con !=3D (dcl-&gt;con ? dcl-&gt;con : acti=
ve_console)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dcl-&gt;ops-&gt;dpy_gl_update) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dcl-&gt;ops-&gt;dpy_gl_upda=
te(dcl, x, y, w, h);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.32.0 (Apple Git-132)<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000003ff9505db0ab333--

