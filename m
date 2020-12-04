Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9CD2CEE09
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 13:25:56 +0100 (CET)
Received: from localhost ([::1]:42132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klA9r-0004mx-5B
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 07:25:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1klA8f-0004DY-92
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 07:24:41 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:44273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1klA8d-00056y-3m
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 07:24:41 -0500
Received: by mail-ed1-x542.google.com with SMTP id l5so5584423edq.11
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 04:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7tU8B+5Dd1hQfumpYBOYl9fUrkp8lQOxlyKlYUxRcjM=;
 b=Mj1vSO6YFZfxly/+Pq/tQi1/zw1ukFCTEq1wqz62VS+6R6bI7xOJvKclWGj++78AmE
 yE8d1MX646cr61PEYddT9s8YLwubT/F9Y2BqmPqJAKRTUMCQVXOecRZ/v8MYsfWRsHlC
 88F3YjpvHlRNZPekV6rao0Af51qba4smv7mMeayfXXXhlPdodksYRrG4lqQ052KLp1hG
 uQMgwxzUQnJCTGzxgDspO4ffiXvSlsGp8cZbfBi4+HrLX9f7A0J5r3feIE2rxQSAf/HI
 XnVPe+6bLD09BMIbj9Dv8Rh59ueljb5PtY7J37SeLTDKITIDn98t91pkhak/r+c0JWWu
 qVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7tU8B+5Dd1hQfumpYBOYl9fUrkp8lQOxlyKlYUxRcjM=;
 b=c+xvCdK34MyPK4GREPIyvUzgSKqRGYfsqm6lykpy3ABuRWMoObeq22YRWDpIhdoVa4
 Bb8CqKokdNffC5sB/27yLskkM4LCEVvHbYyxB4l0z7iSiIZfNUystOP808T980Vrg7Jd
 cZSZ2300OT5IAb0GhoseefHTQ0NM9/NBs3Zun4eBldHADrBjVBkbppimXn6JCyGv1Y+T
 kqObCl6GbR9Rzy2LlB5xEdJ2pTIioaKjEsh3FejYm3RPYKvwIFqDu+PPB496ICXP+C0l
 H2wvOvlkLHIa9l40t4Xp76UROtPheTlO7X+MOYp1X6d5kMI+GEfaI6wIM0cnFO1J0DHh
 Vs0g==
X-Gm-Message-State: AOAM530vmpE2v7qsfroe8c/oxWNBuEgWN6HwXXttpjddcVIdoVlOFEDF
 fiSFnH33gAp6injgWEdsoSzETSe7bzMvs31n+5R8vmkjLc3klg==
X-Google-Smtp-Source: ABdhPJxAoiZ66P+m2fZxo6SJ0i6rc6Ex9N0U1yV2fPsE8v3vTkwagDYHtTT2s21tJRgTg44P0vC5DUcQuqurxjD7So8=
X-Received: by 2002:a50:a245:: with SMTP id 63mr7196678edl.314.1607084677570; 
 Fri, 04 Dec 2020 04:24:37 -0800 (PST)
MIME-Version: 1.0
References: <20201203110806.13556-1-kraxel@redhat.com>
 <20201203110806.13556-9-kraxel@redhat.com>
In-Reply-To: <20201203110806.13556-9-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 4 Dec 2020 16:24:25 +0400
Message-ID: <CAJ+F1CLROO5z--hJ2KaL2j4-cA3DBK-QgvLDoXkTKgEbheQ8Ag@mail.gmail.com>
Subject: Re: [PATCH 8/9] vnc: add support for extended desktop resize
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000054aa7405b5a28f35"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x542.google.com
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

--00000000000054aa7405b5a28f35
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Dec 3, 2020 at 3:13 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> The extended desktop resize encoding adds support for (a) clients
> sending resize requests to the server, and (b) multihead support.
>
> This patch implements (a).  All resize requests are rejected by qemu.
> Qemu can't resize the framebuffer on its own, this is in the hands of
> the guest, so all qemu can do is forward the request to the guest.
> Should the guest actually resize the framebuffer we can notify the vnc
> client later with a separate message.
>
> This requires support in the display device.  Works with virtio-gpu.
>
>
> https://github.com/rfbproto/rfbproto/blob/master/rfbproto.rst#extendeddes=
ktopsize-pseudo-encoding
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  ui/vnc.h |  2 ++
>  ui/vnc.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 65 insertions(+), 1 deletion(-)
>
> diff --git a/ui/vnc.h b/ui/vnc.h
> index c8d3ad9ec496..77a310947bd6 100644
> --- a/ui/vnc.h
> +++ b/ui/vnc.h
> @@ -442,6 +442,7 @@ enum {
>
>  enum VncFeatures {
>      VNC_FEATURE_RESIZE,
> +    VNC_FEATURE_RESIZE_EXT,
>      VNC_FEATURE_HEXTILE,
>      VNC_FEATURE_POINTER_TYPE_CHANGE,
>      VNC_FEATURE_WMVI,
> @@ -456,6 +457,7 @@ enum VncFeatures {
>  };
>
>  #define VNC_FEATURE_RESIZE_MASK              (1 << VNC_FEATURE_RESIZE)
> +#define VNC_FEATURE_RESIZE_EXT_MASK          (1 << VNC_FEATURE_RESIZE_EX=
T)
>  #define VNC_FEATURE_HEXTILE_MASK             (1 << VNC_FEATURE_HEXTILE)
>  #define VNC_FEATURE_POINTER_TYPE_CHANGE_MASK (1 <<
> VNC_FEATURE_POINTER_TYPE_CHANGE)
>  #define VNC_FEATURE_WMVI_MASK                (1 << VNC_FEATURE_WMVI)
> diff --git a/ui/vnc.c b/ui/vnc.c
> index bdaf384f71a4..a15132faa96f 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -663,10 +663,35 @@ void vnc_framebuffer_update(VncState *vs, int x, in=
t
> y, int w, int h,
>      vnc_write_s32(vs, encoding);
>  }
>
> +static void vnc_desktop_resize_ext(VncState *vs, bool reject)
> +{
> +    vnc_lock_output(vs);
> +    vnc_write_u8(vs, VNC_MSG_SERVER_FRAMEBUFFER_UPDATE);
> +    vnc_write_u8(vs, 0);
> +    vnc_write_u16(vs, 1); /* number of rects */
> +    vnc_framebuffer_update(vs,
> +                           reject ? 1 : 0,


1 "The client receiving this message requested a change of the screen
layout. The change may or may not have happened depending on server policy
or available resources. The status code in the *y-position* field must be
used to determine which."
ok

0 "The screen layout was changed via non-RFB means on the server."
ok

+                           reject ? 3 : 0,
>

3 "Invalid screen layout"
ok

+                           vs->client_width, vs->client_height,
> +                           VNC_ENCODING_DESKTOP_RESIZE_EXT);
> +    vnc_write_u8(vs, 1);  /* number of screens */
> +    vnc_write_u8(vs, 0);  /* padding */
> +    vnc_write_u8(vs, 0);  /* padding */
> +    vnc_write_u8(vs, 0);  /* padding */
> +    vnc_write_u32(vs, 0); /* screen id */
> +    vnc_write_u16(vs, 0); /* screen x-pos */
> +    vnc_write_u16(vs, 0); /* screen y-pos */
> +    vnc_write_u16(vs, vs->client_width);
> +    vnc_write_u16(vs, vs->client_height);
> +    vnc_write_u32(vs, 0); /* screen flags */
> +    vnc_unlock_output(vs);
> +    vnc_flush(vs);
> +}
>
>  static void vnc_desktop_resize(VncState *vs, bool force)
>  {
> -    if (vs->ioc =3D=3D NULL || !vnc_has_feature(vs, VNC_FEATURE_RESIZE))=
 {
> +    if (vs->ioc =3D=3D NULL || (!vnc_has_feature(vs, VNC_FEATURE_RESIZE)=
 &&
> +                            !vnc_has_feature(vs,
> VNC_FEATURE_RESIZE_EXT))) {
>          return;
>      }
>      if (vs->client_width =3D=3D pixman_image_get_width(vs->vd->server) &=
&
> @@ -681,6 +706,12 @@ static void vnc_desktop_resize(VncState *vs, bool
> force)
>             pixman_image_get_height(vs->vd->server) >=3D 0);
>      vs->client_width =3D pixman_image_get_width(vs->vd->server);
>      vs->client_height =3D pixman_image_get_height(vs->vd->server);
> +
> +    if (vnc_has_feature(vs, VNC_FEATURE_RESIZE_EXT)) {
> +        vnc_desktop_resize_ext(vs, false);
> +        return;
> +    }
> +
>      vnc_lock_output(vs);
>      vnc_write_u8(vs, VNC_MSG_SERVER_FRAMEBUFFER_UPDATE);
>      vnc_write_u8(vs, 0);
> @@ -2110,6 +2141,9 @@ static void set_encodings(VncState *vs, int32_t
> *encodings, size_t n_encodings)
>          case VNC_ENCODING_DESKTOPRESIZE:
>              vs->features |=3D VNC_FEATURE_RESIZE_MASK;
>              break;
> +        case VNC_ENCODING_DESKTOP_RESIZE_EXT:
> +            vs->features |=3D VNC_FEATURE_RESIZE_EXT_MASK;
> +            break;
>          case VNC_ENCODING_POINTER_TYPE_CHANGE:
>              vs->features |=3D VNC_FEATURE_POINTER_TYPE_CHANGE_MASK;
>              break;
> @@ -2431,6 +2465,34 @@ static int protocol_client_msg(VncState *vs,
> uint8_t *data, size_t len)
>              break;
>          }
>          break;
> +    case VNC_MSG_CLIENT_SET_DESKTOP_SIZE:
> +    {
> +        size_t size;
> +        uint8_t screens;
> +        uint16_t width;
> +        uint16_t height;
> +        QemuUIInfo info;
> +
> +        if (len < 8) {
> +            return 8;
> +        }
> +
> +        screens =3D read_u8(data, 6);
> +        size    =3D 8 + screens * 16;
> +        if (len < size) {
> +            return size;
> +        }
>

Maybe leave a TODO note for handling multiple screens etc?

lgtm
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

+
> +        width   =3D read_u16(data, 2);
> +        height  =3D read_u16(data, 4);
> +        vnc_desktop_resize_ext(vs, true);
> +
> +        memset(&info, 0, sizeof(info));
> +        info.width =3D width;
> +        info.height =3D height;
> +        dpy_set_ui_info(vs->vd->dcl.con, &info);
> +        break;
> +    }
>      default:
>          VNC_DEBUG("Msg: %d\n", data[0]);
>          vnc_client_error(vs);
> --
> 2.27.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000054aa7405b5a28f35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 3, 2020 at 3:13 PM Gerd=
 Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The ext=
ended desktop resize encoding adds support for (a) clients<br>
sending resize requests to the server, and (b) multihead support.<br>
<br>
This patch implements (a).=C2=A0 All resize requests are rejected by qemu.<=
br>
Qemu can&#39;t resize the framebuffer on its own, this is in the hands of<b=
r>
the guest, so all qemu can do is forward the request to the guest.<br>
Should the guest actually resize the framebuffer we can notify the vnc<br>
client later with a separate message.<br>
<br>
This requires support in the display device.=C2=A0 Works with virtio-gpu.<b=
r>
<br>
<a href=3D"https://github.com/rfbproto/rfbproto/blob/master/rfbproto.rst#ex=
tendeddesktopsize-pseudo-encoding" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/rfbproto/rfbproto/blob/master/rfbproto.rst#extendeddesktops=
ize-pseudo-encoding</a><br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br>
---<br>
=C2=A0ui/vnc.h |=C2=A0 2 ++<br>
=C2=A0ui/vnc.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++++++++=
-<br>
=C2=A02 files changed, 65 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/ui/vnc.h b/ui/vnc.h<br>
index c8d3ad9ec496..77a310947bd6 100644<br>
--- a/ui/vnc.h<br>
+++ b/ui/vnc.h<br>
@@ -442,6 +442,7 @@ enum {<br>
<br>
=C2=A0enum VncFeatures {<br>
=C2=A0 =C2=A0 =C2=A0VNC_FEATURE_RESIZE,<br>
+=C2=A0 =C2=A0 VNC_FEATURE_RESIZE_EXT,<br>
=C2=A0 =C2=A0 =C2=A0VNC_FEATURE_HEXTILE,<br>
=C2=A0 =C2=A0 =C2=A0VNC_FEATURE_POINTER_TYPE_CHANGE,<br>
=C2=A0 =C2=A0 =C2=A0VNC_FEATURE_WMVI,<br>
@@ -456,6 +457,7 @@ enum VncFeatures {<br>
=C2=A0};<br>
<br>
=C2=A0#define VNC_FEATURE_RESIZE_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (1 &lt;&lt; VNC_FEATURE_RESIZE)<br>
+#define VNC_FEATURE_RESIZE_EXT_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &=
lt;&lt; VNC_FEATURE_RESIZE_EXT)<br>
=C2=A0#define VNC_FEATURE_HEXTILE_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0(1 &lt;&lt; VNC_FEATURE_HEXTILE)<br>
=C2=A0#define VNC_FEATURE_POINTER_TYPE_CHANGE_MASK (1 &lt;&lt; VNC_FEATURE_=
POINTER_TYPE_CHANGE)<br>
=C2=A0#define VNC_FEATURE_WMVI_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (1 &lt;&lt; VNC_FEATURE_WMVI)<br>
diff --git a/ui/vnc.c b/ui/vnc.c<br>
index bdaf384f71a4..a15132faa96f 100644<br>
--- a/ui/vnc.c<br>
+++ b/ui/vnc.c<br>
@@ -663,10 +663,35 @@ void vnc_framebuffer_update(VncState *vs, int x, int =
y, int w, int h,<br>
=C2=A0 =C2=A0 =C2=A0vnc_write_s32(vs, encoding);<br>
=C2=A0}<br>
<br>
+static void vnc_desktop_resize_ext(VncState *vs, bool reject)<br>
+{<br>
+=C2=A0 =C2=A0 vnc_lock_output(vs);<br>
+=C2=A0 =C2=A0 vnc_write_u8(vs, VNC_MSG_SERVER_FRAMEBUFFER_UPDATE);<br>
+=C2=A0 =C2=A0 vnc_write_u8(vs, 0);<br>
+=C2=A0 =C2=A0 vnc_write_u16(vs, 1); /* number of rects */<br>
+=C2=A0 =C2=A0 vnc_framebuffer_update(vs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0reject ? 1 : 0,</blockquote><div>=C2=A0</div><div>1=
 &quot;The client receiving this message requested a change of the screen
layout. The change may or may not have happened depending on server
policy or available resources. The status code in the <em>y-position</em>
field must be used to determine which.&quot;</div><div>ok<br></div><div>=C2=
=A0</div><div>0 &quot;The screen layout was changed via non-RFB means on th=
e server.&quot;</div><div>ok</div><div><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reject ? 3 : 0,<br></blockq=
uote><div><br></div><div>3 &quot;Invalid screen layout&quot;</div><div>ok <=
br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0vs-&gt;client_width, vs-&gt;client_height,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0VNC_ENCODING_DESKTOP_RESIZE_EXT);<br>
+=C2=A0 =C2=A0 vnc_write_u8(vs, 1);=C2=A0 /* number of screens */<br>
+=C2=A0 =C2=A0 vnc_write_u8(vs, 0);=C2=A0 /* padding */<br>
+=C2=A0 =C2=A0 vnc_write_u8(vs, 0);=C2=A0 /* padding */<br>
+=C2=A0 =C2=A0 vnc_write_u8(vs, 0);=C2=A0 /* padding */<br>
+=C2=A0 =C2=A0 vnc_write_u32(vs, 0); /* screen id */<br>
+=C2=A0 =C2=A0 vnc_write_u16(vs, 0); /* screen x-pos */<br>
+=C2=A0 =C2=A0 vnc_write_u16(vs, 0); /* screen y-pos */<br>
+=C2=A0 =C2=A0 vnc_write_u16(vs, vs-&gt;client_width);<br>
+=C2=A0 =C2=A0 vnc_write_u16(vs, vs-&gt;client_height);<br>
+=C2=A0 =C2=A0 vnc_write_u32(vs, 0); /* screen flags */<br>
+=C2=A0 =C2=A0 vnc_unlock_output(vs);<br>
+=C2=A0 =C2=A0 vnc_flush(vs);<br>
+}<br>
<br>
=C2=A0static void vnc_desktop_resize(VncState *vs, bool force)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 if (vs-&gt;ioc =3D=3D NULL || !vnc_has_feature(vs, VNC_FEATU=
RE_RESIZE)) {<br>
+=C2=A0 =C2=A0 if (vs-&gt;ioc =3D=3D NULL || (!vnc_has_feature(vs, VNC_FEAT=
URE_RESIZE) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 !vnc_has_feature(vs, VNC_FEATURE_RESIZE_EXT))) {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (vs-&gt;client_width =3D=3D pixman_image_get_width(v=
s-&gt;vd-&gt;server) &amp;&amp;<br>
@@ -681,6 +706,12 @@ static void vnc_desktop_resize(VncState *vs, bool forc=
e)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pixman_image_get_height(vs-&gt;vd=
-&gt;server) &gt;=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0vs-&gt;client_width =3D pixman_image_get_width(vs-&gt;v=
d-&gt;server);<br>
=C2=A0 =C2=A0 =C2=A0vs-&gt;client_height =3D pixman_image_get_height(vs-&gt=
;vd-&gt;server);<br>
+<br>
+=C2=A0 =C2=A0 if (vnc_has_feature(vs, VNC_FEATURE_RESIZE_EXT)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vnc_desktop_resize_ext(vs, false);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0vnc_lock_output(vs);<br>
=C2=A0 =C2=A0 =C2=A0vnc_write_u8(vs, VNC_MSG_SERVER_FRAMEBUFFER_UPDATE);<br=
>
=C2=A0 =C2=A0 =C2=A0vnc_write_u8(vs, 0);<br>
@@ -2110,6 +2141,9 @@ static void set_encodings(VncState *vs, int32_t *enco=
dings, size_t n_encodings)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case VNC_ENCODING_DESKTOPRESIZE:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vs-&gt;features |=3D VNC_FE=
ATURE_RESIZE_MASK;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case VNC_ENCODING_DESKTOP_RESIZE_EXT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vs-&gt;features |=3D VNC_FEATURE=
_RESIZE_EXT_MASK;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case VNC_ENCODING_POINTER_TYPE_CHANGE:<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vs-&gt;features |=3D VNC_FE=
ATURE_POINTER_TYPE_CHANGE_MASK;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
@@ -2431,6 +2465,34 @@ static int protocol_client_msg(VncState *vs, uint8_t=
 *data, size_t len)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 case VNC_MSG_CLIENT_SET_DESKTOP_SIZE:<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t screens;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint16_t width;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint16_t height;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QemuUIInfo info;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &lt; 8) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 8;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 screens =3D read_u8(data, 6);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 size=C2=A0 =C2=A0 =3D 8 + screens * 16;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &lt; size) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>Maybe le=
ave a TODO note for handling multiple screens etc?</div><div><br> </div><di=
v>lgtm</div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:=
marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt; <br></div>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 width=C2=A0 =C2=A0=3D read_u16(data, 2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 height=C2=A0 =3D read_u16(data, 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vnc_desktop_resize_ext(vs, true);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(&amp;info, 0, sizeof(info));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 info.width =3D width;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 info.height =3D height;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dpy_set_ui_info(vs-&gt;vd-&gt;dcl.con, &amp;in=
fo);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VNC_DEBUG(&quot;Msg: %d\n&quot;, data[0])=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnc_client_error(vs);<br>
-- <br>
2.27.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000054aa7405b5a28f35--

