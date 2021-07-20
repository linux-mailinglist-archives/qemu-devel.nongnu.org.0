Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA233D01D8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 20:42:43 +0200 (CEST)
Received: from localhost ([::1]:58596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5uhW-00008x-4q
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 14:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m5ugk-0007vL-HF
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:41:54 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:33702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m5ugh-0000lX-Ne
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:41:54 -0400
Received: by mail-ed1-x534.google.com with SMTP id dj21so29800055edb.0
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 11:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ItBtFpN+7BOgI79RkdZUbHYlJr6kfccnosRQlGUXJd8=;
 b=KmMPH5TQlgjIKYftoq8E8eq6OD5rHF0oRHXcLudCqNOkLeWCpOrVJfMOcrHhLL4cHi
 UbL2nBaRgbvHfjXHVOyWMosEknIhBbN9Jli2uhddoxdc1MUg0gUs4DSObfTQTap9r2Nf
 M065muIpkQoGZdechvGogf5iuHAEmexIbL4KlUd7+1g4/piUXTGWRO6D8KoXHSb3nxCZ
 1HzSdOV86U9pSP1+tOmhjBqe26io70f+XV2I84pDgMIK1A7i/i8YPzY5GSHOaKXH670v
 FYOWa6ej6x/8Mz8pzQCDkQ8HapyzZqGRdH9x/bsrPSNhugRk0O0CqsDphHuZWUeuBczf
 7i/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ItBtFpN+7BOgI79RkdZUbHYlJr6kfccnosRQlGUXJd8=;
 b=sNfcyoksMraz0BQ+s5EJXEAK+qQndq9Rxcga0XWNNakj1WfQVAJo48dvUpR5+L8oNr
 RL2I2oA47scr5H9ZpamvPFElrD/u8/L50vgDeGFkHigwIwhsuMB/skJeIF/rPPMYt+UO
 tq8yUSXeu+gkPBSw1BL0xtP9LuM26vEqtRoAQ+9/TdWOPkEmaF3X3+qBkpTDwt82f/lk
 RxyNDjTYOAA4SKc5B6VAgHbIO1nmmta4KZAql3+9c+WzTsx8DTIWinT79mO3xAuTrquj
 9DVg1o2fXtYYIzrKT/fN6J88kYBVGoIE/ApwWY0HMHtIpcCZk75SKn91oQ+wZsfSwN5V
 hWlw==
X-Gm-Message-State: AOAM533nImKiboZT0eM2z09v8MBgkGII8wnLjLiGdPwInf/8J27uORZZ
 xDNJI2LNYXXq516ob5oSb4D87pktD9MtUujdGnE=
X-Google-Smtp-Source: ABdhPJzMPlERE6pDnobtSvE925qvja3QF/2UuwYlqJFiHMTUgZrY7gfOFZwjGPMStuzworbF2UKHHF7fGcLc4qfZGhQ=
X-Received: by 2002:a50:fe95:: with SMTP id d21mr42760170edt.257.1626806509722; 
 Tue, 20 Jul 2021 11:41:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210720143940.291413-1-denniswoelfing@gmx.de>
In-Reply-To: <20210720143940.291413-1-denniswoelfing@gmx.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 20 Jul 2021 22:41:37 +0400
Message-ID: <CAJ+F1CJC2j2paiT1saJhJHUQR2i07PvEh2Bvharg_iDFijg8bw@mail.gmail.com>
Subject: Re: [PATCH for 6.1 v2] ui/gtk: Fix relative mouse with multiple
 monitors
To: =?UTF-8?Q?Dennis_W=C3=B6lfing?= <denniswoelfing@gmx.de>
Content-Type: multipart/alternative; boundary="000000000000215fe205c792684c"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x534.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000215fe205c792684c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 20, 2021 at 6:43 PM Dennis W=C3=B6lfing <denniswoelfing@gmx.de>
wrote:

> To handle relative mouse input the event handler needs to move the mouse
> away from the screen edges. Failing to do so results in the mouse
> getting stuck at invisible walls. However the current implementation for
> this is broken on hosts with multiple monitors.
>
> With multiple monitors the mouse can be located outside of the current
> monitor which is not handled by the current code. Also the monitor
> itself might be located at coordinates different from (0, 0).
>
> Signed-off-by: Dennis W=C3=B6lfing <denniswoelfing@gmx.de>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
> Changes in v2:
> Warp the mouse to the center of the monitor.
>
>  ui/gtk.c | 26 +++++++-------------------
>  1 file changed, 7 insertions(+), 19 deletions(-)
>
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 376b4d528d..18542c7633 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -865,37 +865,25 @@ static gboolean gd_motion_event(GtkWidget *widget,
> GdkEventMotion *motion,
>          GdkWindow *win =3D gtk_widget_get_window(widget);
>          GdkMonitor *monitor =3D gdk_display_get_monitor_at_window(dpy, w=
in);
>          GdkRectangle geometry;
> -        int screen_width, screen_height;
>
>          int x =3D (int)motion->x_root;
>          int y =3D (int)motion->y_root;
>
>          gdk_monitor_get_geometry(monitor, &geometry);
> -        screen_width =3D geometry.width;
> -        screen_height =3D geometry.height;
>
>          /* In relative mode check to see if client pointer hit
> -         * one of the screen edges, and if so move it back by
> -         * 200 pixels. This is important because the pointer
> +         * one of the monitor edges, and if so move it back to the
> +         * center of the monitor. This is important because the pointer
>           * in the server doesn't correspond 1-for-1, and so
>           * may still be only half way across the screen. Without
>           * this warp, the server pointer would thus appear to hit
>           * an invisible wall */
> -        if (x =3D=3D 0) {
> -            x +=3D 200;
> -        }
> -        if (y =3D=3D 0) {
> -            y +=3D 200;
> -        }
> -        if (x =3D=3D (screen_width - 1)) {
> -            x -=3D 200;
> -        }
> -        if (y =3D=3D (screen_height - 1)) {
> -            y -=3D 200;
> -        }
> -
> -        if (x !=3D (int)motion->x_root || y !=3D (int)motion->y_root) {
> +        if (x <=3D geometry.x || x - geometry.x >=3D geometry.width - 1 =
||
> +            y <=3D geometry.y || y - geometry.y >=3D geometry.height - 1=
) {
>              GdkDevice *dev =3D gdk_event_get_device((GdkEvent *)motion);
> +            x =3D geometry.x + geometry.width / 2;
> +            y =3D geometry.y + geometry.height / 2;
> +
>              gdk_device_warp(dev, screen, x, y);
>              s->last_set =3D FALSE;
>              return FALSE;
> --
> 2.32.0
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000215fe205c792684c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 20, 2021 at 6:43 PM Denni=
s W=C3=B6lfing &lt;<a href=3D"mailto:denniswoelfing@gmx.de">denniswoelfing@=
gmx.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">To handle relative mouse input the event handler needs to move the mo=
use<br>
away from the screen edges. Failing to do so results in the mouse<br>
getting stuck at invisible walls. However the current implementation for<br=
>
this is broken on hosts with multiple monitors.<br>
<br>
With multiple monitors the mouse can be located outside of the current<br>
monitor which is not handled by the current code. Also the monitor<br>
itself might be located at coordinates different from (0, 0).<br>
<br>
Signed-off-by: Dennis W=C3=B6lfing &lt;<a href=3D"mailto:denniswoelfing@gmx=
.de" target=3D"_blank">denniswoelfing@gmx.de</a>&gt;<br></blockquote><div><=
br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:mar=
candre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div> <b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
Changes in v2:<br>
Warp the mouse to the center of the monitor.<br>
<br>
=C2=A0ui/gtk.c | 26 +++++++-------------------<br>
=C2=A01 file changed, 7 insertions(+), 19 deletions(-)<br>
<br>
diff --git a/ui/gtk.c b/ui/gtk.c<br>
index 376b4d528d..18542c7633 100644<br>
--- a/ui/gtk.c<br>
+++ b/ui/gtk.c<br>
@@ -865,37 +865,25 @@ static gboolean gd_motion_event(GtkWidget *widget, Gd=
kEventMotion *motion,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GdkWindow *win =3D gtk_widget_get_window(=
widget);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GdkMonitor *monitor =3D gdk_display_get_m=
onitor_at_window(dpy, win);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GdkRectangle geometry;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int screen_width, screen_height;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int x =3D (int)motion-&gt;x_root;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int y =3D (int)motion-&gt;y_root;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gdk_monitor_get_geometry(monitor, &amp;ge=
ometry);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 screen_width =3D geometry.width;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 screen_height =3D geometry.height;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* In relative mode check to see if clien=
t pointer hit<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* one of the screen edges, and if so mov=
e it back by<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 200 pixels. This is important because =
the pointer<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* one of the monitor edges, and if so mo=
ve it back to the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* center of the monitor. This is importa=
nt because the pointer<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * in the server doesn&#39;t correspond 1=
-for-1, and so<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * may still be only half way across the =
screen. Without<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * this warp, the server pointer would th=
us appear to hit<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * an invisible wall */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (x =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x +=3D 200;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (y =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 y +=3D 200;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (x =3D=3D (screen_width - 1)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x -=3D 200;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (y =3D=3D (screen_height - 1)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 y -=3D 200;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (x !=3D (int)motion-&gt;x_root || y !=3D (i=
nt)motion-&gt;y_root) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (x &lt;=3D geometry.x || x - geometry.x &gt=
;=3D geometry.width - 1 ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 y &lt;=3D geometry.y || y - geom=
etry.y &gt;=3D geometry.height - 1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GdkDevice *dev =3D gdk_even=
t_get_device((GdkEvent *)motion);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x =3D geometry.x + geometry.widt=
h / 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 y =3D geometry.y + geometry.heig=
ht / 2;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gdk_device_warp(dev, screen=
, x, y);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;last_set =3D FALSE;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return FALSE;<br>
--<br>
2.32.0<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000215fe205c792684c--

