Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEF42CC13E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 16:51:00 +0100 (CET)
Received: from localhost ([::1]:41824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkUPC-0007y1-PS
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 10:50:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kkUNn-0007Ru-Pl; Wed, 02 Dec 2020 10:49:31 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:33490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kkUNk-00074d-UO; Wed, 02 Dec 2020 10:49:31 -0500
Received: by mail-ej1-x643.google.com with SMTP id 7so5114095ejm.0;
 Wed, 02 Dec 2020 07:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FPyZK3RPJYro0MJgaw/JY+B2dR3rUNo58dZwN3bhadE=;
 b=X9v8rRaJ9cPhfw1p9I7ph5VXEXAiUN1wA4z5B8PTfVxRQByZzcZywOo/dsA9M4A8fr
 WgmjYHdOb3NRnn+P42VRA/Qhsul/xjMYaWAOqEQdvAJw3H1ROPyyAK75OwW9G4D8AJtT
 +CJNjfjlIVUhB/fi/6nu0hrHSnNBt4fCTVtIBgD7uT4nkNUAIeq1/O8SOKGZXIeY/She
 jB/c8vdBCGU0GmClmZLaqrEFyTa8AVw8TlT/UvmTrd/RE1Gp9gdXPGEiXnNwOYURnl9A
 V7xRM6h8Y7U37oo34OWu3gFS1zcEslW3kQr4bYR14MfxJhhgESypozb0AOj+eAMY7f7f
 3U5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FPyZK3RPJYro0MJgaw/JY+B2dR3rUNo58dZwN3bhadE=;
 b=EVbYUIE73ks9seiKdPQrWVBiFvFE8NcIxwikzg/bgpv7XyYZCzFGG/Xoa0s9VeWtBS
 I5lVdTZauOKUCV00kk/euDK2sOdf7wqcKuyVJbdHOmNF52Izys/9eNQkopKJYNBf+Ek5
 Xk1FDjZTylubxoIHlXIeC3fgQ7rTFkZKFAYGyZtjkFjBCeZvBdSvPYeNXkT/FtuARQJQ
 GF/xDzDXDEvVfrryxX37RL5AM4LPXgWNT/JwG4pKkRFPuMlVHNyLV9pyrWH5KoR7PHzm
 KZhCzTYgDwtKBKptcrk1cs8oyRbqpJOMTyUe0KttOT9Gr6s4zGFWWGbXPx3RMZpIy56o
 6sKA==
X-Gm-Message-State: AOAM531CemxSPGU11dVN6jAr4wKTnmI0QBU/nll0c0tw4d9TdKKDrx2U
 COCwPF3o2CQa5/1tzIX/oARQpVlr3ZHLxiXUR3M=
X-Google-Smtp-Source: ABdhPJyHVweoE6cdHPnM6pze3MF5rEKtHux8bN3HhRDDjGYnKOwK2BOtq1AJM5iuyyNrk4lj938/rhxnR8pf3qP74AM=
X-Received: by 2002:a17:906:385b:: with SMTP id
 w27mr369073ejc.109.1606924166822; 
 Wed, 02 Dec 2020 07:49:26 -0800 (PST)
MIME-Version: 1.0
References: <20201202152611.677753-1-stefanha@redhat.com>
 <20201202152611.677753-2-stefanha@redhat.com>
In-Reply-To: <20201202152611.677753-2-stefanha@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 2 Dec 2020 19:49:15 +0400
Message-ID: <CAJ+F1CLx=YdYPO8kS8ATpXCuwZ0cUS0rvbb6UcOCpKB_tgNBDA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] contrib/vhost-user-blk: avoid g_return_val_if()
 input validation
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000002501be05b57d3030"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x643.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002501be05b57d3030
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 2, 2020 at 7:26 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:

> Do not validate input with g_return_val_if(). This API is intended for
> checking programming errors and is compiled out with -DG_DISABLE_CHECKS.
>
> Use an explicit if statement for input validation so it cannot
> accidentally be compiled out.
>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  contrib/vhost-user-blk/vhost-user-blk.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/contrib/vhost-user-blk/vhost-user-blk.c
> b/contrib/vhost-user-blk/vhost-user-blk.c
> index dc981bf945..60e3c9ed37 100644
> --- a/contrib/vhost-user-blk/vhost-user-blk.c
> +++ b/contrib/vhost-user-blk/vhost-user-blk.c
> @@ -404,7 +404,11 @@ vub_get_config(VuDev *vu_dev, uint8_t *config,
> uint32_t len)
>      VugDev *gdev;
>      VubDev *vdev_blk;
>
> -    g_return_val_if_fail(len <=3D sizeof(struct virtio_blk_config), -1);
> +    if (len > sizeof(struct virtio_blk_config)) {
> +        fprintf(stderr, "Invalid get_config len %u, expected <=3D %zu\n"=
,
> +                len, sizeof(struct virtio_blk_config));
> +        return -1;
> +    }
>
>      gdev =3D container_of(vu_dev, VugDev, parent);
>      vdev_blk =3D container_of(gdev, VubDev, parent);
> --
> 2.28.0
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000002501be05b57d3030
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 2, 2020 at 7:26 PM Stefan=
 Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com">stefanha@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Do =
not validate input with g_return_val_if(). This API is intended for<br>
checking programming errors and is compiled out with -DG_DISABLE_CHECKS.<br=
>
<br>
Use an explicit if statement for input validation so it cannot<br>
accidentally be compiled out.<br>
<br>
Suggested-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" ta=
rget=3D"_blank">armbru@redhat.com</a>&gt;<br>
Signed-off-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" t=
arget=3D"_blank">stefanha@redhat.com</a>&gt;<br></blockquote><div><br></div=
><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.l=
ureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div>=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0contrib/vhost-user-blk/vhost-user-blk.c | 6 +++++-<br>
=C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-b=
lk/vhost-user-blk.c<br>
index dc981bf945..60e3c9ed37 100644<br>
--- a/contrib/vhost-user-blk/vhost-user-blk.c<br>
+++ b/contrib/vhost-user-blk/vhost-user-blk.c<br>
@@ -404,7 +404,11 @@ vub_get_config(VuDev *vu_dev, uint8_t *config, uint32_=
t len)<br>
=C2=A0 =C2=A0 =C2=A0VugDev *gdev;<br>
=C2=A0 =C2=A0 =C2=A0VubDev *vdev_blk;<br>
<br>
-=C2=A0 =C2=A0 g_return_val_if_fail(len &lt;=3D sizeof(struct virtio_blk_co=
nfig), -1);<br>
+=C2=A0 =C2=A0 if (len &gt; sizeof(struct virtio_blk_config)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Invalid get_config len %=
u, expected &lt;=3D %zu\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len, sizeof(struct=
 virtio_blk_config));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0gdev =3D container_of(vu_dev, VugDev, parent);<br>
=C2=A0 =C2=A0 =C2=A0vdev_blk =3D container_of(gdev, VubDev, parent);<br>
-- <br>
2.28.0<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000002501be05b57d3030--

