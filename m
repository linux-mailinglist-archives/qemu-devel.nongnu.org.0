Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 266BC2CEDA2
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 12:59:25 +0100 (CET)
Received: from localhost ([::1]:50702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl9kB-0002rC-IV
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 06:59:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kl9iU-00020S-K7
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 06:57:38 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:37252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kl9iS-00042P-In
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 06:57:38 -0500
Received: by mail-ej1-x641.google.com with SMTP id ga15so8308268ejb.4
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 03:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dysd6cWOjtTAVq4nSKhn+o3+el7TPRXIcqOFaVRfiaA=;
 b=MZsYje8meeFvydQdqFSSHVBhbwNgskUX93d3V0CUvyzQTlO48zGdktosu4Ydba4n4s
 jknHFQdRuKVbaBa0QZITaV8AvON9EHnPCVW1+m26VTcMzkHA5RIdRNYzU1mfEtmy1gaX
 w0K2Sq+l/CkOJ/VnZyXqSghVTtNEcuFJBKB3EVO6j6hk+jFEUYb3wGMzZN/o7B/9pj9z
 mFtdW0NSOnEpgFemotRsMwDaC2TcZGTU4J5Rv9LVOrhoSyz+v05ifr5DTLy9tXrA/sVk
 oonp2WCSApo+Dgaixrv8mY/Pcq9ctNGJabhYPv5rSItVqKcfLUSv1+oR2EfOu0hl6etx
 gMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dysd6cWOjtTAVq4nSKhn+o3+el7TPRXIcqOFaVRfiaA=;
 b=RltaAGxuWaQ0HPnFfl2f/TPPMCMvZTKQlDp+g0fFtrQOSOhB6/Vj/82tZO9B92OrV4
 om6nTAMmQOCfY6vdwE7hqw2Ite3IlS+f6i0nVZAZTe+JRIrAi6rwS9kS/G4dCi18nsu3
 GbaQ6Fe2BsuOdz7kzFrvvvlHmTw+B1KbTfafRXVCI3if0lcKl9/oJo2LAu/YaXAXhKhO
 Y/o811xchgNy9nu3LURkYT9Fgzc6wQqtYwPZMtVUQTCRCLYZZUUgYl6Zvm4FjXxyFXij
 NK+nGmD2ax3F0+JAvmu/ZfMei4eSxyEODzIN5zwsWksJxgJrByS7NmfCn1oixhDos2mx
 RMzw==
X-Gm-Message-State: AOAM5310QBE0CN8NhM4UpDcbwDAQSOtpEOw8tAytUih5yE4LIcYYlxcB
 QwwrcRYu63oummYRPeGbRLJWwAc7ooCpvRF8kVQ=
X-Google-Smtp-Source: ABdhPJwrH1EmUlfF8e1wXAKBoeo1+/bqdzsnf+RUmnrAkoBa/DM/8cOeYGMQk7U08mWfJQjn5XnIJamn0H/14XGiW2U=
X-Received: by 2002:a17:906:9452:: with SMTP id
 z18mr6798265ejx.389.1607083055023; 
 Fri, 04 Dec 2020 03:57:35 -0800 (PST)
MIME-Version: 1.0
References: <20201203110806.13556-1-kraxel@redhat.com>
 <20201203110806.13556-8-kraxel@redhat.com>
In-Reply-To: <20201203110806.13556-8-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 4 Dec 2020 15:57:23 +0400
Message-ID: <CAJ+F1C+UFScS8_+fzRniYwKepxv4FQr0=TFTGsBhg22kfw7zRA@mail.gmail.com>
Subject: Re: [PATCH 7/9] vnc: force initial resize message
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000009e895b05b5a22e6a"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x641.google.com
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

--0000000000009e895b05b5a22e6a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Dec 3, 2020 at 3:12 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> The vnc server should send desktop resize notifications unconditionally
> on a new client connect, for feature negotiation reasons.  Add a bool
> flag to vnc_desktop_resize() to force sending the message even in case
> there is no size change.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>

In principle, this looks harmless. But the spec says:

"The server should only send a *DesktopSize* pseudo-rectangle when an
actual change of the framebuffer dimensions has occurred. Some clients
respond to a *DesktopSize* pseudo-rectangle in a way that could send the
system into an infinite loop if the server sent out the pseudo-rectangle
for anything other than an actual change."
(
https://github.com/rfbproto/rfbproto/blob/master/rfbproto.rst#server-semant=
ics
)

I can't say if sending desktop resize during the initial SetEncoding phase
is really compliant with the specification. Also, it's unclear to me if the
client is allowed to SetEncoding multiple times (in which there would be no
dimension change occurring).

What did you fix with this? Is it worth a clarification in the
specification?

thanks

---
>  ui/vnc.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 247e80d8f5c8..bdaf384f71a4 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -664,13 +664,14 @@ void vnc_framebuffer_update(VncState *vs, int x, in=
t
> y, int w, int h,
>  }
>
>
> -static void vnc_desktop_resize(VncState *vs)
> +static void vnc_desktop_resize(VncState *vs, bool force)
>  {
>      if (vs->ioc =3D=3D NULL || !vnc_has_feature(vs, VNC_FEATURE_RESIZE))=
 {
>          return;
>      }
>      if (vs->client_width =3D=3D pixman_image_get_width(vs->vd->server) &=
&
> -        vs->client_height =3D=3D pixman_image_get_height(vs->vd->server)=
) {
> +        vs->client_height =3D=3D pixman_image_get_height(vs->vd->server)=
 &&
> +        !force) {
>          return;
>      }
>
> @@ -800,7 +801,7 @@ static void vnc_dpy_switch(DisplayChangeListener *dcl=
,
>
>      QTAILQ_FOREACH(vs, &vd->clients, next) {
>          vnc_colordepth(vs);
> -        vnc_desktop_resize(vs);
> +        vnc_desktop_resize(vs, false);
>          if (vs->vd->cursor) {
>              vnc_cursor_define(vs);
>          }
> @@ -2143,7 +2144,7 @@ static void set_encodings(VncState *vs, int32_t
> *encodings, size_t n_encodings)
>              break;
>          }
>      }
> -    vnc_desktop_resize(vs);
> +    vnc_desktop_resize(vs, true);
>      check_pointer_type_change(&vs->mouse_mode_notifier, NULL);
>      vnc_led_state_change(vs);
>      if (vs->vd->cursor) {
> --
> 2.27.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000009e895b05b5a22e6a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 3, 2020 at 3:12 PM Gerd=
 Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The vnc=
 server should send desktop resize notifications unconditionally<br>
on a new client connect, for feature negotiation reasons.=C2=A0 Add a bool<=
br>
flag to vnc_desktop_resize() to force sending the message even in case<br>
there is no size change.<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br></blockquote><div><br></div><div>=
In principle, this looks harmless. But the spec says:</div><div><br></div><=
div>&quot;The server should only send a <em>DesktopSize</em> pseudo-rectang=
le when an
actual change of the framebuffer dimensions has occurred. Some clients
respond to a <em>DesktopSize</em> pseudo-rectangle in a way that could send
the system into an infinite loop if the server sent out the
pseudo-rectangle for anything other than an actual change.&quot;</div><div>=
(<a href=3D"https://github.com/rfbproto/rfbproto/blob/master/rfbproto.rst#s=
erver-semantics">https://github.com/rfbproto/rfbproto/blob/master/rfbproto.=
rst#server-semantics</a>)</div><div><br></div><div>I can&#39;t say if sendi=
ng desktop resize during the initial SetEncoding phase is really compliant =
with the specification. Also, it&#39;s unclear to me if the client is allow=
ed to SetEncoding multiple times (in which there would be no dimension chan=
ge occurring).<br></div><div><br> </div><div>What did you fix with this? Is=
 it worth a clarification in the specification?</div><div><br></div><div>th=
anks</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0ui/vnc.c | 9 +++++----<br>
=C2=A01 file changed, 5 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/ui/vnc.c b/ui/vnc.c<br>
index 247e80d8f5c8..bdaf384f71a4 100644<br>
--- a/ui/vnc.c<br>
+++ b/ui/vnc.c<br>
@@ -664,13 +664,14 @@ void vnc_framebuffer_update(VncState *vs, int x, int =
y, int w, int h,<br>
=C2=A0}<br>
<br>
<br>
-static void vnc_desktop_resize(VncState *vs)<br>
+static void vnc_desktop_resize(VncState *vs, bool force)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (vs-&gt;ioc =3D=3D NULL || !vnc_has_feature(vs, VNC_=
FEATURE_RESIZE)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (vs-&gt;client_width =3D=3D pixman_image_get_width(v=
s-&gt;vd-&gt;server) &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vs-&gt;client_height =3D=3D pixman_image_get_h=
eight(vs-&gt;vd-&gt;server)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vs-&gt;client_height =3D=3D pixman_image_get_h=
eight(vs-&gt;vd-&gt;server) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 !force) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -800,7 +801,7 @@ static void vnc_dpy_switch(DisplayChangeListener *dcl,<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0QTAILQ_FOREACH(vs, &amp;vd-&gt;clients, next) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnc_colordepth(vs);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vnc_desktop_resize(vs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vnc_desktop_resize(vs, false);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (vs-&gt;vd-&gt;cursor) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnc_cursor_define(vs);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -2143,7 +2144,7 @@ static void set_encodings(VncState *vs, int32_t *enco=
dings, size_t n_encodings)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 vnc_desktop_resize(vs);<br>
+=C2=A0 =C2=A0 vnc_desktop_resize(vs, true);<br>
=C2=A0 =C2=A0 =C2=A0check_pointer_type_change(&amp;vs-&gt;mouse_mode_notifi=
er, NULL);<br>
=C2=A0 =C2=A0 =C2=A0vnc_led_state_change(vs);<br>
=C2=A0 =C2=A0 =C2=A0if (vs-&gt;vd-&gt;cursor) {<br>
-- <br>
2.27.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000009e895b05b5a22e6a--

