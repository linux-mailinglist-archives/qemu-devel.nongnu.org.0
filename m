Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ED72CED4A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 12:41:51 +0100 (CET)
Received: from localhost ([::1]:39544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl9TD-0005Cv-0t
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 06:41:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kl9R5-0004EG-0z
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 06:39:39 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:45045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kl9R1-0005Pz-2z
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 06:39:36 -0500
Received: by mail-ed1-x541.google.com with SMTP id l5so5455328edq.11
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 03:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NpoBVp4tgYrNQ0Jsbncp2sU1H+nwPf7C9XlmHMf0COE=;
 b=BkNO9FLCjdHhtg/XV70r08TB8yZs7Gw3dkGoB0t7PVS+M7KHO+oMqsZFCLFlgErOsu
 x/94yM9WRZn+UaMlpqxpGtYyFFCCP1SJP5fIzbvVOo/svI1qTZSmMYnnls1O1JeVAuUK
 G0garzfJHm7b3ueYj/XgiKRcpzjYFNbXJmNSZZpdBQcCUAaNBqO83fcYdNOeFYjDBkx2
 SPHVi1ErHKJNwOjV60JAxCGUFFl6rJJpQgswRG+T4bKFbudL0zKB5W/LIgI31YGzoGU+
 NjSfyKBbvczY/JZ5ZIF77MGv2+uRGis2Lf/VzGF6xKzkLV/IGq0iI0r5REM1/StqQGot
 b8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NpoBVp4tgYrNQ0Jsbncp2sU1H+nwPf7C9XlmHMf0COE=;
 b=XyFU4MaLtoECrpB2qQVml6qPP1szr9RFm1ytd3KhMj29a7RFFdZj5D9BTQ9p0itGqy
 WMSWt08+K4ROO8h9zI1my4jwghYYSR1Hb+tBWDaBF1dbly8jcdHd3H4+YHAwObyFBBMz
 0Uqn9qPRw5VypfMSgEizgNsln5G4p9uLZ7K/ctxgOrobNFQiN1k1oYn5GANx5SZSF55/
 IKQsTBEljDrEt5CRc7avAHWgtV3bnhWM5QfI1io7WkRhdU9K/YHZ7oYfK6irO8eA94wB
 GAHYQTo+NXCGZ+REiR+/X0rbCDTTBguSTYlLutX1Rk/t0aKsV7NyaiAlL1PQsu2eTYJk
 nIkg==
X-Gm-Message-State: AOAM530Ni+myeuAAi7swJ1jdQnxdqceqlI1/GObnS+ldFPtSN0/80XZh
 oxwTVIqjI9PWZ4NkZY188P51nuzXIuoQQv+vtDI=
X-Google-Smtp-Source: ABdhPJyvUjpUm19gOBQSFhSM6OTXLWidDnUJvJgAjg9sTfe5bOg/B6mes8gYiPh8uJPsBhwXAC+Bv9vblRXrNsAJyvs=
X-Received: by 2002:a05:6402:318f:: with SMTP id
 di15mr7094115edb.237.1607081973576; 
 Fri, 04 Dec 2020 03:39:33 -0800 (PST)
MIME-Version: 1.0
References: <20201203110806.13556-1-kraxel@redhat.com>
 <20201203110806.13556-7-kraxel@redhat.com>
In-Reply-To: <20201203110806.13556-7-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 4 Dec 2020 15:39:22 +0400
Message-ID: <CAJ+F1CK8c8cSfZQKQc+zfj5r2Ewi4TGN=WbOngiy98VX3HYzYA@mail.gmail.com>
Subject: Re: [PATCH 6/9] vnc: add alpha cursor support
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000028fc5b05b5a1ee30"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x541.google.com
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

--00000000000028fc5b05b5a1ee30
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Dec 3, 2020 at 3:11 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> There is a new vnc extension for cursors with an alpha channel.  Use
> it if supported by the vnc client, prefer it over the "rich cursor"
> extension which supports only a bitmask for transparency.
>
> This is a visible improvement especially on modern desktops which
> actually use the alpha channel when defining cursors.
>
>
> https://github.com/rfbproto/rfbproto/blob/master/rfbproto.rst#cursor-with=
-alpha-pseudo-encoding
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  ui/vnc.h |  2 ++
>  ui/vnc.c | 21 ++++++++++++++++++---
>  2 files changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/ui/vnc.h b/ui/vnc.h
> index 6f5006da3593..c8d3ad9ec496 100644
> --- a/ui/vnc.h
> +++ b/ui/vnc.h
> @@ -448,6 +448,7 @@ enum VncFeatures {
>      VNC_FEATURE_TIGHT,
>      VNC_FEATURE_ZLIB,
>      VNC_FEATURE_RICH_CURSOR,
> +    VNC_FEATURE_ALPHA_CURSOR,
>      VNC_FEATURE_TIGHT_PNG,
>      VNC_FEATURE_ZRLE,
>      VNC_FEATURE_ZYWRLE,
> @@ -461,6 +462,7 @@ enum VncFeatures {
>  #define VNC_FEATURE_TIGHT_MASK               (1 << VNC_FEATURE_TIGHT)
>  #define VNC_FEATURE_ZLIB_MASK                (1 << VNC_FEATURE_ZLIB)
>  #define VNC_FEATURE_RICH_CURSOR_MASK         (1 <<
> VNC_FEATURE_RICH_CURSOR)
> +#define VNC_FEATURE_ALPHA_CURSOR_MASK        (1 <<
> VNC_FEATURE_ALPHA_CURSOR)
>  #define VNC_FEATURE_TIGHT_PNG_MASK           (1 << VNC_FEATURE_TIGHT_PNG=
)
>  #define VNC_FEATURE_ZRLE_MASK                (1 << VNC_FEATURE_ZRLE)
>  #define VNC_FEATURE_ZYWRLE_MASK              (1 << VNC_FEATURE_ZYWRLE)
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 8c2771c1ce3b..247e80d8f5c8 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -937,6 +937,18 @@ static int vnc_cursor_define(VncState *vs)
>      QEMUCursor *c =3D vs->vd->cursor;
>      int isize;
>
> +    if (vnc_has_feature(vs, VNC_FEATURE_ALPHA_CURSOR)) {
> +        vnc_lock_output(vs);
> +        vnc_write_u8(vs,  VNC_MSG_SERVER_FRAMEBUFFER_UPDATE);
> +        vnc_write_u8(vs,  0);  /*  padding     */
> +        vnc_write_u16(vs, 1);  /*  # of rects  */
> +        vnc_framebuffer_update(vs, c->hot_x, c->hot_y, c->width,
> c->height,
> +                               VNC_ENCODING_ALPHA_CURSOR);
> +        vnc_write_s32(vs, VNC_ENCODING_RAW);
> +        vnc_write(vs, c->data, c->width * c->height * 4);
> +        vnc_unlock_output(vs);
> +        return 0;
> +    }
>      if (vnc_has_feature(vs, VNC_FEATURE_RICH_CURSOR)) {
>          vnc_lock_output(vs);
>          vnc_write_u8(vs,  VNC_MSG_SERVER_FRAMEBUFFER_UPDATE);
> @@ -2102,9 +2114,9 @@ static void set_encodings(VncState *vs, int32_t
> *encodings, size_t n_encodings)
>              break;
>          case VNC_ENCODING_RICH_CURSOR:
>              vs->features |=3D VNC_FEATURE_RICH_CURSOR_MASK;
> -            if (vs->vd->cursor) {
> -                vnc_cursor_define(vs);
> -            }
> +            break;
> +        case VNC_ENCODING_ALPHA_CURSOR:
> +            vs->features |=3D VNC_FEATURE_ALPHA_CURSOR_MASK;
>              break;
>          case VNC_ENCODING_EXT_KEY_EVENT:
>              send_ext_key_event_ack(vs);
> @@ -2134,6 +2146,9 @@ static void set_encodings(VncState *vs, int32_t
> *encodings, size_t n_encodings)
>      vnc_desktop_resize(vs);
>      check_pointer_type_change(&vs->mouse_mode_notifier, NULL);
>      vnc_led_state_change(vs);
> +    if (vs->vd->cursor) {
> +        vnc_cursor_define(vs);
> +    }
>

Looks good. Minor nit, I would suggest to do the "if (!vs->vd->cursor)
return" in vnc_cursor_define().

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

 }
>
>  static void set_pixel_conversion(VncState *vs)
> --
> 2.27.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000028fc5b05b5a1ee30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 3, 2020 at 3:11 PM Gerd=
 Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">There i=
s a new vnc extension for cursors with an alpha channel.=C2=A0 Use<br>
it if supported by the vnc client, prefer it over the &quot;rich cursor&quo=
t;<br>
extension which supports only a bitmask for transparency.<br>
<br>
This is a visible improvement especially on modern desktops which<br>
actually use the alpha channel when defining cursors.<br>
<br>
<a href=3D"https://github.com/rfbproto/rfbproto/blob/master/rfbproto.rst#cu=
rsor-with-alpha-pseudo-encoding" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/rfbproto/rfbproto/blob/master/rfbproto.rst#cursor-with-alpha-=
pseudo-encoding</a><br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br>
---<br>
=C2=A0ui/vnc.h |=C2=A0 2 ++<br>
=C2=A0ui/vnc.c | 21 ++++++++++++++++++---<br>
=C2=A02 files changed, 20 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/ui/vnc.h b/ui/vnc.h<br>
index 6f5006da3593..c8d3ad9ec496 100644<br>
--- a/ui/vnc.h<br>
+++ b/ui/vnc.h<br>
@@ -448,6 +448,7 @@ enum VncFeatures {<br>
=C2=A0 =C2=A0 =C2=A0VNC_FEATURE_TIGHT,<br>
=C2=A0 =C2=A0 =C2=A0VNC_FEATURE_ZLIB,<br>
=C2=A0 =C2=A0 =C2=A0VNC_FEATURE_RICH_CURSOR,<br>
+=C2=A0 =C2=A0 VNC_FEATURE_ALPHA_CURSOR,<br>
=C2=A0 =C2=A0 =C2=A0VNC_FEATURE_TIGHT_PNG,<br>
=C2=A0 =C2=A0 =C2=A0VNC_FEATURE_ZRLE,<br>
=C2=A0 =C2=A0 =C2=A0VNC_FEATURE_ZYWRLE,<br>
@@ -461,6 +462,7 @@ enum VncFeatures {<br>
=C2=A0#define VNC_FEATURE_TIGHT_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(1 &lt;&lt; VNC_FEATURE_TIGHT)<br>
=C2=A0#define VNC_FEATURE_ZLIB_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (1 &lt;&lt; VNC_FEATURE_ZLIB)<br>
=C2=A0#define VNC_FEATURE_RICH_CURSOR_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(1 &lt;&lt; VNC_FEATURE_RICH_CURSOR)<br>
+#define VNC_FEATURE_ALPHA_CURSOR_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&l=
t; VNC_FEATURE_ALPHA_CURSOR)<br>
=C2=A0#define VNC_FEATURE_TIGHT_PNG_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(1 &lt;&lt; VNC_FEATURE_TIGHT_PNG)<br>
=C2=A0#define VNC_FEATURE_ZRLE_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (1 &lt;&lt; VNC_FEATURE_ZRLE)<br>
=C2=A0#define VNC_FEATURE_ZYWRLE_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (1 &lt;&lt; VNC_FEATURE_ZYWRLE)<br>
diff --git a/ui/vnc.c b/ui/vnc.c<br>
index 8c2771c1ce3b..247e80d8f5c8 100644<br>
--- a/ui/vnc.c<br>
+++ b/ui/vnc.c<br>
@@ -937,6 +937,18 @@ static int vnc_cursor_define(VncState *vs)<br>
=C2=A0 =C2=A0 =C2=A0QEMUCursor *c =3D vs-&gt;vd-&gt;cursor;<br>
=C2=A0 =C2=A0 =C2=A0int isize;<br>
<br>
+=C2=A0 =C2=A0 if (vnc_has_feature(vs, VNC_FEATURE_ALPHA_CURSOR)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vnc_lock_output(vs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vnc_write_u8(vs,=C2=A0 VNC_MSG_SERVER_FRAMEBUF=
FER_UPDATE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vnc_write_u8(vs,=C2=A0 0);=C2=A0 /*=C2=A0 padd=
ing=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vnc_write_u16(vs, 1);=C2=A0 /*=C2=A0 # of rect=
s=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vnc_framebuffer_update(vs, c-&gt;hot_x, c-&gt;=
hot_y, c-&gt;width, c-&gt;height,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VNC_ENCODING_ALPHA_CURSOR);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vnc_write_s32(vs, VNC_ENCODING_RAW);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vnc_write(vs, c-&gt;data, c-&gt;width * c-&gt;=
height * 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vnc_unlock_output(vs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0if (vnc_has_feature(vs, VNC_FEATURE_RICH_CURSOR)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnc_lock_output(vs);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnc_write_u8(vs,=C2=A0 VNC_MSG_SERVER_FRA=
MEBUFFER_UPDATE);<br>
@@ -2102,9 +2114,9 @@ static void set_encodings(VncState *vs, int32_t *enco=
dings, size_t n_encodings)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case VNC_ENCODING_RICH_CURSOR:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vs-&gt;features |=3D VNC_FE=
ATURE_RICH_CURSOR_MASK;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vs-&gt;vd-&gt;cursor) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vnc_cursor_define(=
vs);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case VNC_ENCODING_ALPHA_CURSOR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vs-&gt;features |=3D VNC_FEATURE=
_ALPHA_CURSOR_MASK;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case VNC_ENCODING_EXT_KEY_EVENT:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0send_ext_key_event_ack(vs);=
<br>
@@ -2134,6 +2146,9 @@ static void set_encodings(VncState *vs, int32_t *enco=
dings, size_t n_encodings)<br>
=C2=A0 =C2=A0 =C2=A0vnc_desktop_resize(vs);<br>
=C2=A0 =C2=A0 =C2=A0check_pointer_type_change(&amp;vs-&gt;mouse_mode_notifi=
er, NULL);<br>
=C2=A0 =C2=A0 =C2=A0vnc_led_state_change(vs);<br>
+=C2=A0 =C2=A0 if (vs-&gt;vd-&gt;cursor) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vnc_cursor_define(vs);<br>
+=C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>Looks good. Minor nit,=
 I would suggest to do the &quot;if (!vs-&gt;vd-&gt;cursor) return&quot; in=
 vnc_cursor_define().</div><div><br></div><div>Reviewed-by: Marc-Andr=C3=A9=
 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau=
@redhat.com</a>&gt; <br></div><div><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
=C2=A0}<br>
<br>
=C2=A0static void set_pixel_conversion(VncState *vs)<br>
-- <br>
2.27.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000028fc5b05b5a1ee30--

