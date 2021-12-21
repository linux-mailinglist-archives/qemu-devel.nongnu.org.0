Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C96047BB5F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 08:58:27 +0100 (CET)
Received: from localhost ([::1]:58496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mza2U-0006Hd-H1
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 02:58:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mzZlo-0007rm-Hg; Tue, 21 Dec 2021 02:41:12 -0500
Received: from [2a00:1450:4864:20::330] (port=36548
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mzZlm-0005e7-S7; Tue, 21 Dec 2021 02:41:12 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 y83-20020a1c7d56000000b003456dfe7c5cso1027438wmc.1; 
 Mon, 20 Dec 2021 23:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g/c1b4obIllR0gqmWGWzWXcHt8kFY0yCzsAFRSWQDO4=;
 b=JqohAYxf+5qhMfoyKQNnJJVScGefuF7Lu4l6ybPBjhVdJO0SA8pXAdhbXYZK9HlPoj
 fRCw7orU7TI6lLSJRH4ygGkyZLo60lj7ZDg/kg1IZhqLLxYGDEafE2M57j0VstvAFqZJ
 bmBiZOclj1rXAEiEgqoca0mQhJna6BkhH9UM8u4ox9EjqPk6kvdfrZvi/+f0EIhxnshI
 /C4Q0VJGULaNcQ5XVicozu+cTowjLzLjO2J0F6OrAOLJOJFpwJje/T6I85dj7OSKIOSW
 uj5N0pcLsOlICVJT8NreI93fbP4pPw9sDbBUTaa46h4locKjRifP3q11pRAKTj8gMA4K
 xomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g/c1b4obIllR0gqmWGWzWXcHt8kFY0yCzsAFRSWQDO4=;
 b=bO5BOXODJSbTHGeVtLDHJhZI69nxTrEo8qA8DvPnwDMt8JK+GAlb+X77YNKXYWCyNg
 /aDUOI/cGjUsDk6Xz9gZQgd99p1pw2P3da3j/Kq7xCt+JXKdwYk6FSS7Yibr/tCwaEQC
 5tididTApX9vpJTXGbG8bdrN40DhD+sc6XfedwNynL2F6v46XWA8aeMbg9rKF8CAaM5D
 S47Eok5RCG4bn+LpFRnBH3n/EVGJHP7AsYcYIdzOj5gDWbiuzhuCuoFPTTG6tve9TvXI
 OUangWKTM2FFapIkkJQzFvoJdE2SbdfLtFMOLedY5HoFAh+fluUA+42FaHxDrlMGhaxk
 uNpQ==
X-Gm-Message-State: AOAM533iJvBtkE04dolK0EqefI4gAQG0x4DX7CXVCvaks8plBg9K5j0B
 o1bSaZ4D7Br5gXPC5M0xPJgzp9e94f6jACfpgRE=
X-Google-Smtp-Source: ABdhPJw3vp58xOFPyr8LaqrfcdlgU3M/tsl8g/ivvfCl2IHfL0ChTevo1cjWD04Ki9tNlDmkXZpRQ4IaZdylMzp4FH0=
X-Received: by 2002:a1c:4406:: with SMTP id r6mr1525274wma.42.1640072469242;
 Mon, 20 Dec 2021 23:41:09 -0800 (PST)
MIME-Version: 1.0
References: <20211219023006.124530-1-orzechowski.alexander@gmail.com>
 <20211219023006.124530-3-orzechowski.alexander@gmail.com>
In-Reply-To: <20211219023006.124530-3-orzechowski.alexander@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 21 Dec 2021 11:40:57 +0400
Message-ID: <CAJ+F1CL4LxdbCOzt+uFTw_ggxQ+forzd7chDQRw8DMsc9EMamA@mail.gmail.com>
Subject: Re: [PATCH 2/4] ui: Remove unnecessary checks
To: Alexander Orzechowski <orzechowski.alexander@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000ef67fe05d3a320f9"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu trival <qemu-trivial@nongnu.org>, QEMU <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ef67fe05d3a320f9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Sun, Dec 19, 2021 at 6:32 AM Alexander Orzechowski <
orzechowski.alexander@gmail.com> wrote:

> These conditionals should never be false as scale_x and scale_y should
> scale the fbw and fbh variables such that the ww and wh variables always
> have a greater magnitude.
>
> Signed-off-by: Alexander Orzechowski <orzechowski.alexander@gmail.com>
>

I don't understand how you reached that conclusion.

scale_x/scale_y can have various values, from 0.25 manually, or pretty much
anything in freescale.

Just adding a breakpoint/debug there and you can see they can be false.

---
>  ui/gtk.c | 27 ++++++---------------------
>  1 file changed, 6 insertions(+), 21 deletions(-)
>
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 824334ff3d..f2d74b253d 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -416,13 +416,8 @@ static void gd_update(DisplayChangeListener *dcl,
>      ww =3D gtk_widget_get_allocated_width(vc->gfx.drawing_area);
>      wh =3D gtk_widget_get_allocated_height(vc->gfx.drawing_area);
>
> -    mx =3D my =3D 0;
> -    if (ww > fbw) {
> -        mx =3D (ww - fbw) / 2;
> -    }
> -    if (wh > fbh) {
> -        my =3D (wh - fbh) / 2;
> -    }
> +    mx =3D (ww - fbw) / 2;
> +    my =3D (wh - fbh) / 2;
>
>      gtk_widget_queue_draw_area(vc->gfx.drawing_area,
>                                 mx + x1, my + y1, (x2 - x1), (y2 - y1));
> @@ -801,13 +796,8 @@ static gboolean gd_draw_event(GtkWidget *widget,
> cairo_t *cr, void *opaque)
>      fbw *=3D vc->gfx.scale_x;
>      fbh *=3D vc->gfx.scale_y;
>
> -    mx =3D my =3D 0;
> -    if (ww > fbw) {
> -        mx =3D (ww - fbw) / 2;
> -    }
> -    if (wh > fbh) {
> -        my =3D (wh - fbh) / 2;
> -    }
> +    mx =3D (ww - fbw) / 2;
> +    my =3D (wh - fbh) / 2;
>
>      cairo_rectangle(cr, 0, 0, ww, wh);
>
> @@ -850,13 +840,8 @@ static gboolean gd_motion_event(GtkWidget *widget,
> GdkEventMotion *motion,
>      ws =3D gdk_window_get_scale_factor(
>              gtk_widget_get_window(vc->gfx.drawing_area));
>
> -    mx =3D my =3D 0;
> -    if (ww > fbw) {
> -        mx =3D (ww - fbw) / 2;
> -    }
> -    if (wh > fbh) {
> -        my =3D (wh - fbh) / 2;
> -    }
> +    mx =3D (ww - fbw) / 2;
> +    my =3D (wh - fbh) / 2;
>
>      x =3D (motion->x - mx) / vc->gfx.scale_x * ws;
>      y =3D (motion->y - my) / vc->gfx.scale_y * ws;
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000ef67fe05d3a320f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Dec 19, 2021 at 6:32 AM Ale=
xander Orzechowski &lt;<a href=3D"mailto:orzechowski.alexander@gmail.com">o=
rzechowski.alexander@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">These conditionals should never be false as s=
cale_x and scale_y should<br>
scale the fbw and fbh variables such that the ww and wh variables always<br=
>
have a greater magnitude.<br>
<br>
Signed-off-by: Alexander Orzechowski &lt;<a href=3D"mailto:orzechowski.alex=
ander@gmail.com" target=3D"_blank">orzechowski.alexander@gmail.com</a>&gt;<=
br></blockquote><div><br></div><div>I don&#39;t understand how you reached =
that conclusion.</div><div><br></div><div>scale_x/scale_y can have various =
values, from 0.25 manually, or pretty much anything in freescale.</div><div=
><br></div><div>Just adding a breakpoint/debug there and you can see they c=
an be false.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
---<br>
=C2=A0ui/gtk.c | 27 ++++++---------------------<br>
=C2=A01 file changed, 6 insertions(+), 21 deletions(-)<br>
<br>
diff --git a/ui/gtk.c b/ui/gtk.c<br>
index 824334ff3d..f2d74b253d 100644<br>
--- a/ui/gtk.c<br>
+++ b/ui/gtk.c<br>
@@ -416,13 +416,8 @@ static void gd_update(DisplayChangeListener *dcl,<br>
=C2=A0 =C2=A0 =C2=A0ww =3D gtk_widget_get_allocated_width(vc-&gt;gfx.drawin=
g_area);<br>
=C2=A0 =C2=A0 =C2=A0wh =3D gtk_widget_get_allocated_height(vc-&gt;gfx.drawi=
ng_area);<br>
<br>
-=C2=A0 =C2=A0 mx =3D my =3D 0;<br>
-=C2=A0 =C2=A0 if (ww &gt; fbw) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mx =3D (ww - fbw) / 2;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 if (wh &gt; fbh) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 my =3D (wh - fbh) / 2;<br>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 mx =3D (ww - fbw) / 2;<br>
+=C2=A0 =C2=A0 my =3D (wh - fbh) / 2;<br>
<br>
=C2=A0 =C2=A0 =C2=A0gtk_widget_queue_draw_area(vc-&gt;gfx.drawing_area,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mx + x1, my + y1, (x2 - x1), (y2 - y=
1));<br>
@@ -801,13 +796,8 @@ static gboolean gd_draw_event(GtkWidget *widget, cairo=
_t *cr, void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0fbw *=3D vc-&gt;gfx.scale_x;<br>
=C2=A0 =C2=A0 =C2=A0fbh *=3D vc-&gt;gfx.scale_y;<br>
<br>
-=C2=A0 =C2=A0 mx =3D my =3D 0;<br>
-=C2=A0 =C2=A0 if (ww &gt; fbw) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mx =3D (ww - fbw) / 2;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 if (wh &gt; fbh) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 my =3D (wh - fbh) / 2;<br>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 mx =3D (ww - fbw) / 2;<br>
+=C2=A0 =C2=A0 my =3D (wh - fbh) / 2;<br>
<br>
=C2=A0 =C2=A0 =C2=A0cairo_rectangle(cr, 0, 0, ww, wh);<br>
<br>
@@ -850,13 +840,8 @@ static gboolean gd_motion_event(GtkWidget *widget, Gdk=
EventMotion *motion,<br>
=C2=A0 =C2=A0 =C2=A0ws =3D gdk_window_get_scale_factor(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_widget_get_window(vc-&g=
t;gfx.drawing_area));<br>
<br>
-=C2=A0 =C2=A0 mx =3D my =3D 0;<br>
-=C2=A0 =C2=A0 if (ww &gt; fbw) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mx =3D (ww - fbw) / 2;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 if (wh &gt; fbh) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 my =3D (wh - fbh) / 2;<br>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 mx =3D (ww - fbw) / 2;<br>
+=C2=A0 =C2=A0 my =3D (wh - fbh) / 2;<br>
<br>
=C2=A0 =C2=A0 =C2=A0x =3D (motion-&gt;x - mx) / vc-&gt;gfx.scale_x * ws;<br=
>
=C2=A0 =C2=A0 =C2=A0y =3D (motion-&gt;y - my) / vc-&gt;gfx.scale_y * ws;<br=
>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000ef67fe05d3a320f9--

