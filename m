Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 256BA3CD43F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 13:59:58 +0200 (CEST)
Received: from localhost ([::1]:59264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5RwD-0001nA-7s
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 07:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m5RVB-00067x-Kt
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:32:01 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:35346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m5RV9-0000OC-IK
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:32:01 -0400
Received: by mail-ej1-x636.google.com with SMTP id oz7so24296607ejc.2
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 04:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+mgTK0FSykUTtD8cshDqXNs12Qw7XJOx6q/5bpNC4ns=;
 b=NI3QwRm3dxKtsyZ2yBXW/VS6FUyzZS0KViHHhboZOcYgkCXVnDsPQEkzf8yny0jItM
 BKXayMin6YIOq2Z0YRiFVRITLi+8DgNe/+N6gl6s9YsX3fkWKLlVpvEk0x87W847EC0y
 bIAKltAaSZCtckhHWvZ529Hh9OfgeuyHFyYnvCfq9oPt0hpO1ol83oyrXO6wQczeNbo1
 f2oQAbj8fZjZW/dOY4rPEAgrvS5g8uckAShwP+VKpQEuSDvHTrxMI0BO4TV6qoesrmJv
 Pi0ibNIBgxIG4DiXu6ierN8ng+gOZXnGRytyBsm5UB7sjh9UHkIWCjInrlmdlctcM/g5
 FzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+mgTK0FSykUTtD8cshDqXNs12Qw7XJOx6q/5bpNC4ns=;
 b=j1oF5pt/ZY3uHy/U/ruRfDa8bK8XlmqxNS4SpZvrlUdJauiritGMnXTo6jNgwBwFTA
 UvZ2P/vYNs3RmM/eRpSBnyrh3v0kHZ/KMPi9EsNalRfSAmoBpoOqPJQ+TjNr3vTph2us
 eBD5/eqFgAKsv0/SqW00cRh2j9HmZfNXj2lep7YABMhYspQ6afEFMYYu7s3osvqAxR3q
 fY2rmpseyNo+VGewySI/Bq8EXW46ymdyCePx5p5CChNNzFZ+IfLUJ7JT8jZ10F8UsLg4
 E7jKq+ai8I8tWv9HqNmJkU+Pp1o07/pWNupAwcZXPPY4nde7NKSqRIxGoU38SbakeUfl
 H43g==
X-Gm-Message-State: AOAM532O/ifxAwRCTiU4DMHKrp3HvqmoQNgcp3QzMgI20v8rtoWyctjn
 Q5tmzfBmBQstQ5VB900RTGzwEIq9YnykHYCMsdg=
X-Google-Smtp-Source: ABdhPJwAK+Mqf8RCOnWlwDJdghD3lT3bpU16hdQqsvoxt6+sFfNVi6X70GM4rA0SLl9MsCdWYFzvZdzNRS/4VMNdxJY=
X-Received: by 2002:a17:907:97c9:: with SMTP id
 js9mr26944040ejc.109.1626694317083; 
 Mon, 19 Jul 2021 04:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210629132410.286813-1-denniswoelfing@gmx.de>
In-Reply-To: <20210629132410.286813-1-denniswoelfing@gmx.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 19 Jul 2021 15:31:45 +0400
Message-ID: <CAJ+F1CKDBxMngPZpQOF0RAiq0hHZEt8mpFaAx9T2z7nb5zLjRQ@mail.gmail.com>
Subject: Re: [PATCH] ui/gtk: Fix relative mouse with multiple monitors
To: =?UTF-8?Q?Dennis_W=C3=B6lfing?= <denniswoelfing@gmx.de>
Content-Type: multipart/alternative; boundary="000000000000ed928b05c778483c"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x636.google.com
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

--000000000000ed928b05c778483c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dennis

On Tue, Jun 29, 2021 at 5:26 PM Dennis W=C3=B6lfing <denniswoelfing@gmx.de>
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

Looks reasonable to me. In spice-gtk we have slightly different code, we
wrap at the middle of the monitor instead (
https://gitlab.freedesktop.org/spice/spice-gtk/-/blob/master/src/spice-widg=
et.c#L1214),
what do you think?

And also, spice-gtk has special cases for w32 and wayland, which behave
differently.

Gtk4 is also different, as device_warp() is gone (it will have to handle it
specifically again for the different platforms:
https://gitlab.gnome.org/malureau/rdw/-/blob/master/rdw/src/display.rs#L812=
)



---
>  ui/gtk.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
>
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 98046f577b..5258532b19 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -865,33 +865,30 @@ static gboolean gd_motion_event(GtkWidget *widget,
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
> +         * one of the monitor edges, and if so move it back by
>           * 200 pixels. This is important because the pointer
>           * in the server doesn't correspond 1-for-1, and so
>           * may still be only half way across the screen. Without
>           * this warp, the server pointer would thus appear to hit
>           * an invisible wall */
> -        if (x =3D=3D 0) {
> -            x +=3D 200;
> +        if (x <=3D geometry.x) {
> +            x =3D geometry.x + 200;
>          }
> -        if (y =3D=3D 0) {
> -            y +=3D 200;
> +        if (y <=3D geometry.y) {
> +            y =3D geometry.y + 200;
>          }
> -        if (x =3D=3D (screen_width - 1)) {
> -            x -=3D 200;
> +        if (x - geometry.x >=3D (geometry.width - 1)) {
> +            x =3D geometry.x + (geometry.width - 1) - 200;
>          }
> -        if (y =3D=3D (screen_height - 1)) {
> -            y -=3D 200;
> +        if (y - geometry.y >=3D (geometry.height - 1)) {
> +            y =3D geometry.y + (geometry.height - 1) - 200;
>          }
>
>          if (x !=3D (int)motion->x_root || y !=3D (int)motion->y_root) {
> --
> 2.32.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000ed928b05c778483c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Dennis<br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 29, 2021 at 5:26=
 PM Dennis W=C3=B6lfing &lt;<a href=3D"mailto:denniswoelfing@gmx.de">dennis=
woelfing@gmx.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">To handle relative mouse input the event handler needs to mo=
ve the mouse<br>
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
br></div><div>Looks reasonable to me. In spice-gtk we have slightly differe=
nt code, we wrap at the middle of the monitor instead (<a href=3D"https://g=
itlab.freedesktop.org/spice/spice-gtk/-/blob/master/src/spice-widget.c#L121=
4">https://gitlab.freedesktop.org/spice/spice-gtk/-/blob/master/src/spice-w=
idget.c#L1214</a>), what do you think?<br></div><div><br></div><div>And als=
o, spice-gtk has special cases for w32 and wayland, which behave differentl=
y.</div><div><br></div><div>Gtk4 is also different, as device_warp() is gon=
e (it will have to handle it specifically again for the different platforms=
: <a href=3D"https://gitlab.gnome.org/malureau/rdw/-/blob/master/rdw/src/di=
splay.rs#L812">https://gitlab.gnome.org/malureau/rdw/-/blob/master/rdw/src/=
display.rs#L812</a>)</div><div><br></div><div><br></div><div> <br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0ui/gtk.c | 21 +++++++++------------<br>
=C2=A01 file changed, 9 insertions(+), 12 deletions(-)<br>
<br>
diff --git a/ui/gtk.c b/ui/gtk.c<br>
index 98046f577b..5258532b19 100644<br>
--- a/ui/gtk.c<br>
+++ b/ui/gtk.c<br>
@@ -865,33 +865,30 @@ static gboolean gd_motion_event(GtkWidget *widget, Gd=
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* one of the monitor edges, and if so mo=
ve it back by<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 200 pixels. This is important because =
the pointer<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * in the server doesn&#39;t correspond 1=
-for-1, and so<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * may still be only half way across the =
screen. Without<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * this warp, the server pointer would th=
us appear to hit<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * an invisible wall */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (x =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x +=3D 200;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (x &lt;=3D geometry.x) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x =3D geometry.x + 200;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (y =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 y +=3D 200;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (y &lt;=3D geometry.y) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 y =3D geometry.y + 200;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (x =3D=3D (screen_width - 1)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x -=3D 200;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (x - geometry.x &gt;=3D (geometry.width - 1=
)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x =3D geometry.x + (geometry.wid=
th - 1) - 200;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (y =3D=3D (screen_height - 1)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 y -=3D 200;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (y - geometry.y &gt;=3D (geometry.height - =
1)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 y =3D geometry.y + (geometry.hei=
ght - 1) - 200;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (x !=3D (int)motion-&gt;x_root || y !=
=3D (int)motion-&gt;y_root) {<br>
--<br>
2.32.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000ed928b05c778483c--

