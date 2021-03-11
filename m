Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6643337F95
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 22:23:32 +0100 (CET)
Received: from localhost ([::1]:34068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKSmK-0004Xt-0Z
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 16:23:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lKSiP-0001Hz-5x
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 16:19:29 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:38663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lKSiI-0000wM-MH
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 16:19:28 -0500
Received: by mail-ej1-x62a.google.com with SMTP id mj10so49175192ejb.5
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 13:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c859OltOaeUBULxtm/ETukQThVCbFAR7OWGbv+mGxXY=;
 b=EnqJEiqN4lFGby77l7rlTCaO7MyAoNrYJoTt/9/q2DiEf0+l1/R6Y8eCdAy0+8c3W/
 t9D+mXjqak9xJsu02LmL+4EoVhyY/Xuh34N/4JnHXDJoh8cOUwD6aCOQMGLh5szFzX3l
 d0fXpT/vlxk6bjthtLReslo/RRSyv4LVbyYLlkTC5X3nm8UuFqV0luAZG6D91Lu9Ifgf
 /YS7VNeDTKepSYhzjhQptOF8KoHRUIcL2DBAv89pFoLZhKWt3g5X/O2zio4DplH6KkqE
 WXUS+p17oZRzj6F+iAwJKKwKmT90X8x3SUFyC8Jf9nkn8D65Ky28l/BBoLoYWiV8VXjh
 Rmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c859OltOaeUBULxtm/ETukQThVCbFAR7OWGbv+mGxXY=;
 b=akqVSrN9NeLKnZq8xXRkLXTqinOul8nIn7DcI/K0IePisK6Vp37rS8sY8uRsVMdp08
 HGvVhqG1BRdNhJn/fhp+VJVoVrKgTcVXEt9ZEsI+q0hF8jzVxTy9TskoAOB1WwMgLwt5
 qu8OMpSatAubb/EFGWpTVXPFDOGf178OiKg1tt+GQ4+hZnnWK61qHoL2rJFI88v1nq4S
 WfsK/ysgCIWD85+SVIq31Z1N9UQZS4okXQEReLJGLG+Omt6OMz6e6cQzOg+C9cOESCQ6
 ukTesllTxviPDutHAqh6Dm935C41EqZ6F15JAJRiumu2NU4wfoIWspjocD3OGttj+o24
 uDOg==
X-Gm-Message-State: AOAM5328ljBoDJVhMaj2m48qpxyTAAlrmuQZ1siPb7eQNz/cv9oKmwIY
 Cn7Z5onTFeqGM9f5O01MP2v+wZbvU3J+nELcptI=
X-Google-Smtp-Source: ABdhPJye6gW0Kp94Z2mWrH0tEpynEEh8V3GY0ATg/5mprFKp5AYQ3RnelR95cFsv4AlxzL0dda67aaDNEBgtHaRa1eE=
X-Received: by 2002:a17:906:40c7:: with SMTP id
 a7mr5038328ejk.109.1615497561157; 
 Thu, 11 Mar 2021 13:19:21 -0800 (PST)
MIME-Version: 1.0
References: <20210311182957.486939-1-berrange@redhat.com>
 <20210311182957.486939-4-berrange@redhat.com>
In-Reply-To: <20210311182957.486939-4-berrange@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 12 Mar 2021 01:19:09 +0400
Message-ID: <CAJ+F1CJhURwFsUMUvEVn66JA4ffpOV4S9qbLGP8v4CL4KqUUqg@mail.gmail.com>
Subject: Re: [PATCH 3/4] ui: use client width/height in WMVi message
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000044b57b05bd4956fe"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62a.google.com
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

--00000000000044b57b05bd4956fe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 10:46 PM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om>
wrote:

> The WMVi message is supposed to provide the same width/height
> information as the regular desktop resize and extended desktop
> resize messages. There can be times where the client width and
> height are different from the pixman surface dimensions.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  ui/vnc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 7291429c04..8c9890b3cd 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -2319,8 +2319,8 @@ static void vnc_colordepth(VncState *vs)
>          vnc_write_u8(vs, 0);
>          vnc_write_u16(vs, 1); /* number of rects */
>          vnc_framebuffer_update(vs, 0, 0,
> -                               pixman_image_get_width(vs->vd->server),
> -                               pixman_image_get_height(vs->vd->server),
> +                               vs->client_width,
> +                               vs->client_height,
>                                 VNC_ENCODING_WMVi);
>          pixel_format_message(vs);
>          vnc_unlock_output(vs);
> --
> 2.29.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000044b57b05bd4956fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 11, 2021 at 10:46 PM Dani=
el P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">The WMVi message is supposed to provide the same width/height<br>
information as the regular desktop resize and extended desktop<br>
resize messages. There can be times where the client width and<br>
height are different from the pixman surface dimensions.<br>
<br>
Signed-off-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redha=
t.com" target=3D"_blank">berrange@redhat.com</a>&gt;<br></blockquote><div><=
br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:mar=
candre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></d=
iv><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0ui/vnc.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/ui/vnc.c b/ui/vnc.c<br>
index 7291429c04..8c9890b3cd 100644<br>
--- a/ui/vnc.c<br>
+++ b/ui/vnc.c<br>
@@ -2319,8 +2319,8 @@ static void vnc_colordepth(VncState *vs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnc_write_u8(vs, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnc_write_u16(vs, 1); /* number of rects =
*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnc_framebuffer_update(vs, 0, 0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pixman_image_get_width(vs-&gt;vd-&gt;=
server),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pixman_image_get_height(vs-&gt;vd-&gt=
;server),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vs-&gt;client_width,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vs-&gt;client_height,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VNC_ENCODING_WMVi);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pixel_format_message(vs);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vnc_unlock_output(vs);<br>
-- <br>
2.29.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000044b57b05bd4956fe--

