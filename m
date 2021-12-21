Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B273447BB67
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 09:01:45 +0100 (CET)
Received: from localhost ([::1]:35356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mza5g-0001db-17
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 03:01:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mzZt1-00046Q-WC; Tue, 21 Dec 2021 02:48:44 -0500
Received: from [2a00:1450:4864:20::433] (port=44916
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mzZt0-0006cx-9k; Tue, 21 Dec 2021 02:48:39 -0500
Received: by mail-wr1-x433.google.com with SMTP id t18so25013347wrg.11;
 Mon, 20 Dec 2021 23:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wuEwYTfFZveMLJlpnoAN2w1GUZ6KIbUjuSNevRhdrTQ=;
 b=DRRzlVorU3shEZltOVsvu0iddW6AV8PZMxanufwzGw3BNqtRn4XDS9ZWWniMWWUwyd
 igJVp3qQ4XN8ItRGCMxlHzKHPnf5aHDNwgMhMr/Rta89X921TVXI2Bjz3fkk6wvKUrV9
 taRXCr8d1dPEDBovct6kOtWxwGZrulejc804wT8KXPjccxwX2RKZdWLIBBPV2txdAovt
 d7S4/Y5rGToGfeNkX8y5NmI2WWcoU265T2Vmraa54rdQ5FFirj+i0f79vpnMZG2EBIVG
 LPhgtjQhIRCobzRK4C4+vdRuzqr2zLpklpEhcXQNn5Alx3pTtv/D6lirsjFt2FlSg9S0
 SDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wuEwYTfFZveMLJlpnoAN2w1GUZ6KIbUjuSNevRhdrTQ=;
 b=AXS8Umluh2/Or3dLGfKjU8jCFPIpXA3kaULK2HQpH8L+JR2nL7bxrFY7oTJkpRHBO4
 p7Xql+UZAzyBBZNjixe5n1blnvpwEemd33gHDwAJbgoj3soIP8jbmEJknEPqOg9magb6
 qgcfxoFYQww9oFIa5fri5znZWvzri+NwV3MOmAUOjdcEQfKRmRX8fPk1ce8jsIoPGTyB
 OtT04UdFOsUexpqZvBI1Owsb0LDBWHdLchUZl5S0BEWLDIpLdn8QFxtvaGT8sJJ5Fa4Z
 rYfmBwAHTyOI3TbKxTx9BNOt3w/wvxY/KQn1jOGb6Ibdmq46yIN1iWkSdkyKJutH5jH0
 pyuA==
X-Gm-Message-State: AOAM5329K6pn5OlZU4q5V9eJmGuQqtsQpW7RF4tOKxqDFUo7VmiwleeT
 xgCbZNuRYnNyyeKO3ji02KaSV795HyU/0z1FvuE=
X-Google-Smtp-Source: ABdhPJxo6+gyC6h6td7Pd8ZojkyouI1xvJoDf2VtGb5UxE0xO9ZpB+aPRs9yepvO1gkdmrSl/kcFp5WuAWovQDqO4vQ=
X-Received: by 2002:adf:d213:: with SMTP id j19mr1521685wrh.325.1640072916552; 
 Mon, 20 Dec 2021 23:48:36 -0800 (PST)
MIME-Version: 1.0
References: <20211219023006.124530-1-orzechowski.alexander@gmail.com>
 <20211219023006.124530-5-orzechowski.alexander@gmail.com>
In-Reply-To: <20211219023006.124530-5-orzechowski.alexander@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 21 Dec 2021 11:48:25 +0400
Message-ID: <CAJ+F1CK3aPi3WP9kBpz53Nvp5JR_TQ7CQjoMK3=F38rEHudtAA@mail.gmail.com>
Subject: Re: [PATCH 4/4] ui: Fix gtk/gl when the scaled virtual console does
 not fit the window
To: Alexander Orzechowski <orzechowski.alexander@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000098cf6105d3a33b69"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x433.google.com
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

--00000000000098cf6105d3a33b69
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Sun, Dec 19, 2021 at 6:32 AM Alexander Orzechowski <
orzechowski.alexander@gmail.com> wrote:

> gtk/gl was incorrectly always rendering as if the 'Zoom to Fit' was
> always checked even if it wasn't. This is now using logic closer
> to what is being used for the existing cairo code paths.
>
> Signed-off-by: Alexander Orzechowski <orzechowski.alexander@gmail.com>
>

This doesn't work as expected, the display is not being centered correctly.

---
>  ui/gtk-gl-area.c | 34 +++++++++++++++++++++++++++++-----
>  1 file changed, 29 insertions(+), 5 deletions(-)
>
> diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
> index 01e4e74ee3..ea72f1817b 100644
> --- a/ui/gtk-gl-area.c
> +++ b/ui/gtk-gl-area.c
> @@ -41,16 +41,40 @@ void gd_gl_area_draw(VirtualConsole *vc)
>  #ifdef CONFIG_GBM
>      QemuDmaBuf *dmabuf =3D vc->gfx.guest_fb.dmabuf;
>  #endif
> +    GtkDisplayState *s =3D vc->s;
>      int ww, wh, ws, y1, y2;
> +    int mx, my;
> +    int fbh, fbw;
>
>      if (!vc->gfx.gls) {
>          return;
>      }
>
>      gtk_gl_area_make_current(GTK_GL_AREA(vc->gfx.drawing_area));
> +
> +    fbw =3D surface_width(vc->gfx.ds);
> +    fbh =3D surface_height(vc->gfx.ds);
> +
>      ws =3D
> gdk_window_get_scale_factor(gtk_widget_get_window(vc->gfx.drawing_area));
> -    ww =3D gtk_widget_get_allocated_width(vc->gfx.drawing_area) * ws;
> -    wh =3D gtk_widget_get_allocated_height(vc->gfx.drawing_area) * ws;
> +    ww =3D gtk_widget_get_allocated_width(vc->gfx.drawing_area);
> +    wh =3D gtk_widget_get_allocated_height(vc->gfx.drawing_area);
> +
> +    if (s->full_screen) {
> +        vc->gfx.scale_x =3D (double)ww / fbw;
> +        vc->gfx.scale_y =3D (double)wh / fbh;
> +    } else if (s->free_scale) {
> +        double sx, sy;
> +
> +        sx =3D (double)ww / fbw;
> +        sy =3D (double)wh / fbh;
> +
> +        vc->gfx.scale_x =3D vc->gfx.scale_y =3D MIN(sx, sy);
> +    }
> +
> +    fbw *=3D vc->gfx.scale_x * ws;
> +    fbh *=3D vc->gfx.scale_y * ws;
> +    mx =3D (ww * ws - fbw) / 2;
> +    my =3D (wh * ws - fbh) / 2;
>
>      if (vc->gfx.scanout_mode) {
>          if (!vc->gfx.guest_fb.framebuffer) {
> @@ -70,11 +94,11 @@ void gd_gl_area_draw(VirtualConsole *vc)
>          glBindFramebuffer(GL_READ_FRAMEBUFFER,
> vc->gfx.guest_fb.framebuffer);
>          /* GtkGLArea sets GL_DRAW_FRAMEBUFFER for us */
>
> -        glViewport(0, 0, ww, wh);
> +        glViewport(mx, my, fbw, fbh);
>          y1 =3D vc->gfx.y0_top ? 0 : vc->gfx.h;
>          y2 =3D vc->gfx.y0_top ? vc->gfx.h : 0;
>          glBlitFramebuffer(0, y1, vc->gfx.w, y2,
> -                          0, 0, ww, wh,
> +                          mx, my, fbw, fbh,
>                            GL_COLOR_BUFFER_BIT, GL_NEAREST);
>  #ifdef CONFIG_GBM
>          if (dmabuf) {
> @@ -98,7 +122,7 @@ void gd_gl_area_draw(VirtualConsole *vc)
>          }
>          gtk_gl_area_make_current(GTK_GL_AREA(vc->gfx.drawing_area));
>
> -        surface_gl_setup_viewport(vc->gfx.gls, vc->gfx.ds, ww, wh);
> +        glViewport(mx, my, fbw, fbh);
>          surface_gl_render_texture(vc->gfx.gls, vc->gfx.ds);
>      }
>
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000098cf6105d3a33b69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Dec 19, 2021 at 6:32 AM Ale=
xander Orzechowski &lt;<a href=3D"mailto:orzechowski.alexander@gmail.com">o=
rzechowski.alexander@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">gtk/gl was incorrectly always rendering as if=
 the &#39;Zoom to Fit&#39; was<br>
always checked even if it wasn&#39;t. This is now using logic closer<br>
to what is being used for the existing cairo code paths.<br>
<br>
Signed-off-by: Alexander Orzechowski &lt;<a href=3D"mailto:orzechowski.alex=
ander@gmail.com" target=3D"_blank">orzechowski.alexander@gmail.com</a>&gt;<=
br></blockquote><div><br></div><div>This doesn&#39;t work as expected, the =
display is not being centered correctly.</div><div> <br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0ui/gtk-gl-area.c | 34 +++++++++++++++++++++++++++++-----<br>
=C2=A01 file changed, 29 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c<br>
index 01e4e74ee3..ea72f1817b 100644<br>
--- a/ui/gtk-gl-area.c<br>
+++ b/ui/gtk-gl-area.c<br>
@@ -41,16 +41,40 @@ void gd_gl_area_draw(VirtualConsole *vc)<br>
=C2=A0#ifdef CONFIG_GBM<br>
=C2=A0 =C2=A0 =C2=A0QemuDmaBuf *dmabuf =3D vc-&gt;gfx.guest_fb.dmabuf;<br>
=C2=A0#endif<br>
+=C2=A0 =C2=A0 GtkDisplayState *s =3D vc-&gt;s;<br>
=C2=A0 =C2=A0 =C2=A0int ww, wh, ws, y1, y2;<br>
+=C2=A0 =C2=A0 int mx, my;<br>
+=C2=A0 =C2=A0 int fbh, fbw;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!vc-&gt;gfx.gls) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0gtk_gl_area_make_current(GTK_GL_AREA(vc-&gt;gfx.drawing=
_area));<br>
+<br>
+=C2=A0 =C2=A0 fbw =3D surface_width(vc-&gt;gfx.ds);<br>
+=C2=A0 =C2=A0 fbh =3D surface_height(vc-&gt;gfx.ds);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0ws =3D gdk_window_get_scale_factor(gtk_widget_get_windo=
w(vc-&gt;gfx.drawing_area));<br>
-=C2=A0 =C2=A0 ww =3D gtk_widget_get_allocated_width(vc-&gt;gfx.drawing_are=
a) * ws;<br>
-=C2=A0 =C2=A0 wh =3D gtk_widget_get_allocated_height(vc-&gt;gfx.drawing_ar=
ea) * ws;<br>
+=C2=A0 =C2=A0 ww =3D gtk_widget_get_allocated_width(vc-&gt;gfx.drawing_are=
a);<br>
+=C2=A0 =C2=A0 wh =3D gtk_widget_get_allocated_height(vc-&gt;gfx.drawing_ar=
ea);<br>
+<br>
+=C2=A0 =C2=A0 if (s-&gt;full_screen) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vc-&gt;gfx.scale_x =3D (double)ww / fbw;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vc-&gt;gfx.scale_y =3D (double)wh / fbh;<br>
+=C2=A0 =C2=A0 } else if (s-&gt;free_scale) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 double sx, sy;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sx =3D (double)ww / fbw;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sy =3D (double)wh / fbh;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vc-&gt;gfx.scale_x =3D vc-&gt;gfx.scale_y =3D =
MIN(sx, sy);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 fbw *=3D vc-&gt;gfx.scale_x * ws;<br>
+=C2=A0 =C2=A0 fbh *=3D vc-&gt;gfx.scale_y * ws;<br>
+=C2=A0 =C2=A0 mx =3D (ww * ws - fbw) / 2;<br>
+=C2=A0 =C2=A0 my =3D (wh * ws - fbh) / 2;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (vc-&gt;gfx.scanout_mode) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!vc-&gt;gfx.guest_fb.framebuffer) {<b=
r>
@@ -70,11 +94,11 @@ void gd_gl_area_draw(VirtualConsole *vc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glBindFramebuffer(GL_READ_FRAMEBUFFER, vc=
-&gt;gfx.guest_fb.framebuffer);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* GtkGLArea sets GL_DRAW_FRAMEBUFFER for=
 us */<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 glViewport(0, 0, ww, wh);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 glViewport(mx, my, fbw, fbh);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0y1 =3D vc-&gt;gfx.y0_top ? 0 : vc-&gt;gfx=
.h;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0y2 =3D vc-&gt;gfx.y0_top ? vc-&gt;gfx.h :=
 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glBlitFramebuffer(0, y1, vc-&gt;gfx.w, y2=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0, 0, ww, wh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 mx, my, fbw, fbh,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0GL_COLOR_BUFFER_BIT, GL_NEAREST);<br>
=C2=A0#ifdef CONFIG_GBM<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dmabuf) {<br>
@@ -98,7 +122,7 @@ void gd_gl_area_draw(VirtualConsole *vc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_gl_area_make_current(GTK_GL_AREA(vc-&=
gt;gfx.drawing_area));<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 surface_gl_setup_viewport(vc-&gt;gfx.gls, vc-&=
gt;gfx.ds, ww, wh);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 glViewport(mx, my, fbw, fbh);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0surface_gl_render_texture(vc-&gt;gfx.gls,=
 vc-&gt;gfx.ds);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000098cf6105d3a33b69--

