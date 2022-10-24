Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64602609F3E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 12:42:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omsfR-0006MG-4X; Mon, 24 Oct 2022 04:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1omsfO-0006LZ-Hs
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 04:18:39 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1omsfK-000622-NK
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 04:18:36 -0400
Received: by mail-lf1-x12d.google.com with SMTP id g1so15425658lfu.12
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 01:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rsTcUk1Ola6I20FZlej7PK169fHSkgyfph+EWgTsx6o=;
 b=Segkmjnn9lVdlXM7wkm78WzOIVtPBSAYw3BMJqLBjBtS7xrsN7fiqYtlB3OSskCM+L
 tU8J2Wjqcf39Nwgmvnr2iJQzX0n/1X0fkLRM21ziB1qcLT5GIdFDIfK3bycWOtOAteUj
 4v4Po0h4ZmXyNwVRgiiXKAGZKS7ChDvCDZ5H4zH53iU1X94IYgBSnEPnu+stzGaLzrxA
 YoEdRlk/iki4QfwFtrLisc4fyqBKd0YLgVDASl1aoyG/Q0YMf94102tmf6vNETXzqUjX
 phwPtU9GMQwQAf5q/fK+syDWJFc+KT7GiCiWcJ7Avfa5E42qFaMc5VJ3ZZBjnc+lFe+r
 G9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rsTcUk1Ola6I20FZlej7PK169fHSkgyfph+EWgTsx6o=;
 b=qbOjzqqWHfGsVcvPxm0vSQ1oZi2fV2rhI7jD0NA/JVQcJ3GFEG4yofquyAr/XSoHiy
 +R/QbJH+/a36e4psNs0Af1JqENrhhE9iawgrf4D5Hqwm21uoy6KC26xiQaTRL0qauX0/
 NR962ebuVWSwIvDkFt/JuuOG1rkQI7aDICxEnTwOkt91/lbe7opWFYrCoIOuqNuq7nP+
 85UV6wEuHoYTYviHW/psOhgmUFUKfpDkO6XwrESg0/+xVMCTqIqWCik7DmIBMZ/tpK72
 7shjSHCfsGhVeGT7kxgX7VmvOjywp76m3w2hGojFadkl/Moxeali14Kg+vJfTG1T3Vrc
 tnsA==
X-Gm-Message-State: ACrzQf0r6mxhWSqNIhXBuqLCRKTKRps4oRytS8yXJFEghNEVaO5NKlHz
 +vKZwWmdXo0uiTmONa9iUmRFQgH6RCZNEhO65FF22MLc0AOLtA==
X-Google-Smtp-Source: AMsMyM7zi02pwukA+2LkziyRc8frS2ZwfJhzEXFpQxRh94npROK/3fjssaW3dWvZJ0FkfJj5UEN1w5qc4vG0DKPMcTw=
X-Received: by 2002:a05:6512:c0d:b0:4a2:4129:366e with SMTP id
 z13-20020a0565120c0d00b004a24129366emr12255914lfu.328.1666599512529; Mon, 24
 Oct 2022 01:18:32 -0700 (PDT)
MIME-Version: 1.0
References: <20221021192315.9110-1-dongwon.kim@intel.com>
In-Reply-To: <20221021192315.9110-1-dongwon.kim@intel.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 24 Oct 2022 12:18:21 +0400
Message-ID: <CAJ+F1CLCNSozsdTTno7pitJJPgNeG2Fn8aaQX6-LzV3O9jBnUw@mail.gmail.com>
Subject: Re: [PATCH] ui/gtk: prevent ui lock up when dpy_gl_update called
 again before current draw event occurs
To: Dongwon Kim <dongwon.kim@intel.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Content-Type: multipart/alternative; boundary="000000000000ed61df05ebc36f12"
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000ed61df05ebc36f12
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 22, 2022 at 3:31 AM Dongwon Kim <dongwon.kim@intel.com> wrote:

> A warning, "qemu: warning: console: no gl-unblock within" followed by
> guest scanout lockup can happen if dpy_gl_update is called in a row
> and the second call is made before gd_draw_event scheduled by the first
> call is taking place. This is because draw call returns without
> decrementing
> gl_block ref count if the dmabuf was already submitted as shown below.
>
> (gd_gl_area_draw/gd_egl_draw)
>
>         if (dmabuf) {
>             if (!dmabuf->draw_submitted) {
>                 return;
>             } else {
>                 dmabuf->draw_submitted =3D false;
>             }
>         }
>
> So it should not schedule any redundant draw event in case draw_submitted
> is
> already set in gd_egl_fluch/gd_gl_area_scanout_flush.
>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  ui/gtk-egl.c     | 2 +-
>  ui/gtk-gl-area.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
> index 35f917ceb1..e84431790c 100644
> --- a/ui/gtk-egl.c
> +++ b/ui/gtk-egl.c
> @@ -341,7 +341,7 @@ void gd_egl_flush(DisplayChangeListener *dcl,
>      VirtualConsole *vc =3D container_of(dcl, VirtualConsole, gfx.dcl);
>      GtkWidget *area =3D vc->gfx.drawing_area;
>
> -    if (vc->gfx.guest_fb.dmabuf) {
> +    if (vc->gfx.guest_fb.dmabuf &&
> !vc->gfx.guest_fb.dmabuf->draw_submitted) {
>          graphic_hw_gl_block(vc->gfx.dcl.con, true);
>          vc->gfx.guest_fb.dmabuf->draw_submitted =3D true;
>          gtk_widget_queue_draw_area(area, x, y, w, h);
> diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
> index 682638a197..7696df1f6b 100644
> --- a/ui/gtk-gl-area.c
> +++ b/ui/gtk-gl-area.c
> @@ -278,7 +278,7 @@ void gd_gl_area_scanout_flush(DisplayChangeListener
> *dcl,
>  {
>      VirtualConsole *vc =3D container_of(dcl, VirtualConsole, gfx.dcl);
>
> -    if (vc->gfx.guest_fb.dmabuf) {
> +    if (vc->gfx.guest_fb.dmabuf &&
> !vc->gfx.guest_fb.dmabuf->draw_submitted) {
>          graphic_hw_gl_block(vc->gfx.dcl.con, true);
>          vc->gfx.guest_fb.dmabuf->draw_submitted =3D true;
>      }
> --
> 2.30.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000ed61df05ebc36f12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Oct 22, 2022 at 3:31 AM Dongw=
on Kim &lt;<a href=3D"mailto:dongwon.kim@intel.com">dongwon.kim@intel.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">A =
warning, &quot;qemu: warning: console: no gl-unblock within&quot; followed =
by<br>
guest scanout lockup can happen if dpy_gl_update is called in a row<br>
and the second call is made before gd_draw_event scheduled by the first<br>
call is taking place. This is because draw call returns without decrementin=
g<br>
gl_block ref count if the dmabuf was already submitted as shown below.<br>
<br>
(gd_gl_area_draw/gd_egl_draw)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dmabuf) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!dmabuf-&gt;draw_submitted) {=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dmabuf-&gt;draw_sub=
mitted =3D false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
So it should not schedule any redundant draw event in case draw_submitted i=
s<br>
already set in gd_egl_fluch/gd_gl_area_scanout_flush.<br>
<br>
Cc: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank=
">kraxel@redhat.com</a>&gt;<br>
Cc: Vivek Kasireddy &lt;<a href=3D"mailto:vivek.kasireddy@intel.com" target=
=3D"_blank">vivek.kasireddy@intel.com</a>&gt;<br>
Signed-off-by: Dongwon Kim &lt;<a href=3D"mailto:dongwon.kim@intel.com" tar=
get=3D"_blank">dongwon.kim@intel.com</a>&gt;<br></blockquote><div><br></div=
><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.l=
ureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;<br><br>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0ui/gtk-egl.c=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0ui/gtk-gl-area.c | 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c<br>
index 35f917ceb1..e84431790c 100644<br>
--- a/ui/gtk-egl.c<br>
+++ b/ui/gtk-egl.c<br>
@@ -341,7 +341,7 @@ void gd_egl_flush(DisplayChangeListener *dcl,<br>
=C2=A0 =C2=A0 =C2=A0VirtualConsole *vc =3D container_of(dcl, VirtualConsole=
, gfx.dcl);<br>
=C2=A0 =C2=A0 =C2=A0GtkWidget *area =3D vc-&gt;gfx.drawing_area;<br>
<br>
-=C2=A0 =C2=A0 if (vc-&gt;gfx.guest_fb.dmabuf) {<br>
+=C2=A0 =C2=A0 if (vc-&gt;gfx.guest_fb.dmabuf &amp;&amp; !vc-&gt;gfx.guest_=
fb.dmabuf-&gt;draw_submitted) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0graphic_hw_gl_block(vc-&gt;gfx.dcl.con, t=
rue);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vc-&gt;gfx.guest_fb.dmabuf-&gt;draw_submi=
tted =3D true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_widget_queue_draw_area(area, x, y, w,=
 h);<br>
diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c<br>
index 682638a197..7696df1f6b 100644<br>
--- a/ui/gtk-gl-area.c<br>
+++ b/ui/gtk-gl-area.c<br>
@@ -278,7 +278,7 @@ void gd_gl_area_scanout_flush(DisplayChangeListener *dc=
l,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0VirtualConsole *vc =3D container_of(dcl, VirtualConsole=
, gfx.dcl);<br>
<br>
-=C2=A0 =C2=A0 if (vc-&gt;gfx.guest_fb.dmabuf) {<br>
+=C2=A0 =C2=A0 if (vc-&gt;gfx.guest_fb.dmabuf &amp;&amp; !vc-&gt;gfx.guest_=
fb.dmabuf-&gt;draw_submitted) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0graphic_hw_gl_block(vc-&gt;gfx.dcl.con, t=
rue);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vc-&gt;gfx.guest_fb.dmabuf-&gt;draw_submi=
tted =3D true;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.30.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000ed61df05ebc36f12--

