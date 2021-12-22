Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FB847D157
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 12:54:11 +0100 (CET)
Received: from localhost ([::1]:38632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n00C8-0002xy-Ph
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 06:54:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1n00Ae-0001e1-9L; Wed, 22 Dec 2021 06:52:36 -0500
Received: from [2a00:1450:4864:20::329] (port=53828
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1n00Ac-0002H8-4r; Wed, 22 Dec 2021 06:52:35 -0500
Received: by mail-wm1-x329.google.com with SMTP id l4so1408860wmq.3;
 Wed, 22 Dec 2021 03:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pwDjuVAgvV2N/5+sidQUhABSqlu5LUpVsNu+wQ0RFWg=;
 b=hh3dqhwvABur3bKI5JKK/gkN/SFG68qHOahER5/Q2w45+TRKuXYTfsRestr1SdlO91
 8EYmIqbJsmXH7NfHNEhf60sP3eL+lEYsqwXXk9XwvTvdf4cYOikHWJJi4/rragh8RRQY
 SSEIkfsL/uRu9dzINgKAJcyQrA5bLmMb+5QkJOG1VRTuJ1xHRXQ0duAFlMicigG6f3m+
 7KBY48L1XjcQIWUh2NabbKGaS5QgcqGWn2ZTzylwljlEmJtBUpzMxRHG0IoeddFb3AxJ
 OuopTz5HrAon3FGWIkqHwkf+ihv9nDyeIqQQPiKHwXfS2hH8XYkR3Ya0Nd/i2rDG7WrM
 1HIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pwDjuVAgvV2N/5+sidQUhABSqlu5LUpVsNu+wQ0RFWg=;
 b=TPibyEAD8YhLUrfcDmocHlbs+qRR16MCqHjV84aUDqmss5/M4t933YHy1qtCyYTKAp
 biTB2zg10i6laVWwkeDFET8r9aXSG21ZqACPdDI4yhvP2bKyXBz9UsI+2s2jSF+9RjPg
 iijXWs2/1cVwxayx3gdf7nKKi/XZNtQd0g5+79goTEBos2kaXVX5+o+wv0MVMUbRKhKg
 iT28Cz142nSZDQyemSapZGzvFkgXTj2foKhbP3UJkztU+YPJd294QdmkmtMeIXOMZ1lC
 ViJ+G+sIWgGPPDX40mg6QZ5GkPG1LyB3wRchcU6NkEnhGtxZz9YsQUUtlIMDw57XvJrA
 ya8g==
X-Gm-Message-State: AOAM533j+0eIje4iBKIXMBnkwaponSVizflTQRDyVQa240H79iXhb1iw
 C8HorRzTtdrt3oSLBoInR1IZQOlgL/5yV3ZYj+o=
X-Google-Smtp-Source: ABdhPJw6vkRUqnWb4wCTks3FTM3qL2TmxOXvTd65maN7mfeDrd8af9A5CmUtFL46aABvtzXX9tT+xTwiNkJh58QydCA=
X-Received: by 2002:a1c:4406:: with SMTP id r6mr718741wma.42.1640173952122;
 Wed, 22 Dec 2021 03:52:32 -0800 (PST)
MIME-Version: 1.0
References: <20211222001051.2295513-1-orzechowski.alexander@gmail.com>
 <20211222001051.2295513-4-orzechowski.alexander@gmail.com>
In-Reply-To: <20211222001051.2295513-4-orzechowski.alexander@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 22 Dec 2021 15:52:20 +0400
Message-ID: <CAJ+F1CLcHBmgEwAttHXw5ySuHMO_vtJVyXGiqZSWqV4C_DWfZA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ui: Fix gtk/gl when the scaled virtual console
 does not fit the window
To: Alexander Orzechowski <orzechowski.alexander@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c9428305d3bac1b9"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x329.google.com
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
Cc: qemu trivial <qemu-trivial@nongnu.org>, QEMU <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c9428305d3bac1b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Dec 22, 2021 at 4:11 AM Alexander Orzechowski <
orzechowski.alexander@gmail.com> wrote:

> gtk/gl was incorrectly always rendering as if the 'Zoom to Fit' was
> always checked even if it wasn't. This is now using logic closer
> to what is being used for the existing cairo code paths.
>
> Signed-off-by: Alexander Orzechowski <orzechowski.alexander@gmail.com>
>

This is definitely an improvement for me (on hidpi), but I have some
questions and I don't have much interest in working on qemu GTK3 code.

(fwiw, I hope the future will be around the gtk4 widget I work on at
https://gitlab.com/marcandre.lureau/qemu-display/)

The 2nd patch should come after this one imho, to avoid intermediary extra
regressions.

---
>  ui/gtk-gl-area.c | 34 +++++++++++++++++++++++++++++-----
>  1 file changed, 29 insertions(+), 5 deletions(-)
>
> diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
> index 01e4e74ee3..f4f2dac882 100644
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
>

Why not keep aspect-ratio in full-screen?

(and hopefully the pointer follows the same size logic, as well as the
2d/cairo & gtk-x11/egl code paths..)

+    } else if (s->free_scale) {
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
> +                          mx, my, fbw + mx, fbh + my,
>                            GL_COLOR_BUFFER_BIT, GL_NEAREST);
>  #ifdef CONFIG_GBM
>          if (dmabuf) {
> @@ -98,7 +122,7 @@ void gd_gl_area_draw(VirtualConsole *vc)
>          }
>          gtk_gl_area_make_current(GTK_GL_AREA(vc->gfx.drawing_area));
>
> -        surface_gl_setup_viewport(vc->gfx.gls, vc->gfx.ds, ww, wh);
> +        glViewport(mx, my, fbw, fbh);
>

 We should be able to reuse and share the surface_gl_setup_viewport()
logic, no?

--=20
Marc-Andr=C3=A9 Lureau

--000000000000c9428305d3bac1b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 22, 2021 at 4:11 AM Ale=
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
br></blockquote><div><br></div><div>This is definitely an improvement for m=
e (on hidpi), but I have some questions and I don&#39;t have much interest =
in working on qemu GTK3 code.</div><div><br></div><div>(fwiw, I hope the fu=
ture will be around the gtk4 widget I work on at <a href=3D"https://gitlab.=
com/marcandre.lureau/qemu-display/">https://gitlab.com/marcandre.lureau/qem=
u-display/</a>)</div><div><br></div><div>The 2nd patch should come after th=
is one imho, to avoid intermediary extra regressions.<br></div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0ui/gtk-gl-area.c | 34 +++++++++++++++++++++++++++++-----<br>
=C2=A01 file changed, 29 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c<br>
index 01e4e74ee3..f4f2dac882 100644<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vc-&gt;gfx.scale_y =3D (double)wh / fbh;<br></=
blockquote><div><br></div><div>Why not keep aspect-ratio in full-screen?</d=
iv><div><br></div><div>(and hopefully the pointer follows the same size log=
ic, as well as the 2d/cairo &amp; gtk-x11/egl code paths..)<br></div><div> =
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
=A0 =C2=A0 =C2=A0 mx, my, fbw + mx, fbh + my,<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 glViewport(mx, my, fbw, fbh);<br></blockquote>=
<div><br></div><div>=C2=A0We should be able to reuse and share the surface_=
gl_setup_viewport() logic, no?<br></div></div><br>-- <br><div dir=3D"ltr" c=
lass=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000c9428305d3bac1b9--

