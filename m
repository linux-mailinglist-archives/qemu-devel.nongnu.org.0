Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 789832CC15B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 16:53:47 +0100 (CET)
Received: from localhost ([::1]:47178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkURu-0002SB-HG
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 10:53:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kkUQg-0001KU-77; Wed, 02 Dec 2020 10:52:31 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:36219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kkUQc-0007VG-QB; Wed, 02 Dec 2020 10:52:29 -0500
Received: by mail-ed1-x542.google.com with SMTP id j14so4467829edy.3;
 Wed, 02 Dec 2020 07:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3XMQ4LwAvpJXzBdHEIj6fKRVovH0Phf+Lc07vTqMHzQ=;
 b=Dh6nY3LRDcSfNru6Ch/AoVAxuEEL/7ZpGKHvdadoWtmf3TWO/HCYu4g7ZFvfa1eQOz
 X4awLb3jdWf/4CdEvjvK5xzR8pvFWmpOZmENcz6m1avBBdyC1PIwhzLbdBP9/tjMdjUD
 aY+L6ThzKnoUxMFhe/yNFCOAvH7CC7PMAY5iOFfhjfHPVVMq1KaMMYTCjI0nSz/rnohH
 sW0+v9tsznCpnVK4wcAqz14gxA6yxs9NK49w0FceqKsZX2oxuaSBZoNst4b0yT+MFekm
 Ahkfx5UitmLFF4S5a4Sayq8fYdVEatpZQek252J+KjEtriRTPmZgf5NxaaRLHNWCmSeG
 5k0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3XMQ4LwAvpJXzBdHEIj6fKRVovH0Phf+Lc07vTqMHzQ=;
 b=GZRjJ9CqZkuebBAZM+YOSkREcjWKZaTGe87rNBz2YEXFOeGDv3AZgDZFJ2IK9DUt+R
 fNvzLHFY7bJNwqTa44MLy30J7nlQmSFmga6h1uAzxTytRHGWqYNbvO+nXhmut/SdCuvY
 vqSj2sRAWksdGxR6UKmXRHJ9nKAZUOZdTsViL2sa8BElDoCBwy8QPTmUfj7wWUFXFiaY
 z/eT8+q3fkVWdGlttDzPn/u7oYbeMRR2bcL03D8dY5wljAEuwnadD3a4NkurxXHhHPtV
 tneq2Sl3IRh0h43LgYVH8ygRUZXEpWEAv0Qd1t32RhKiBiTFIShv8S8IVSbfez3T/Anv
 Tcng==
X-Gm-Message-State: AOAM533bCI6NnmnjsfYyAg574ybPiKWS2+uAb58CKb+9XHANpGGaTBBC
 cQZmPtYLrY1Kq5gNCUz/ZOfXjFuHLyf2ncv0AEI=
X-Google-Smtp-Source: ABdhPJwSjoEMU3WZklDtJs58DGd3sxvnQgrqVnujADAGwp3osPZhdBlsm8zUX3g2BAVz9LilxkSBEN3EEiocNZbIWkg=
X-Received: by 2002:a50:e846:: with SMTP id k6mr500259edn.245.1606924345159;
 Wed, 02 Dec 2020 07:52:25 -0800 (PST)
MIME-Version: 1.0
References: <20201202152611.677753-1-stefanha@redhat.com>
 <20201202152611.677753-5-stefanha@redhat.com>
In-Reply-To: <20201202152611.677753-5-stefanha@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 2 Dec 2020 19:52:13 +0400
Message-ID: <CAJ+F1CJoq7modGBdD8DnEhDdGEZJp876TYk2SYDAXAJgCsL+nA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] block/export: avoid g_return_val_if() input
 validation
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c636ba05b57d3a86"
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c636ba05b57d3a86
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 2, 2020 at 7:27 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:

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
>  block/export/vhost-user-blk-server.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/block/export/vhost-user-blk-server.c
> b/block/export/vhost-user-blk-server.c
> index 62672d1cb9..bccbc98d57 100644
> --- a/block/export/vhost-user-blk-server.c
> +++ b/block/export/vhost-user-blk-server.c
> @@ -267,7 +267,11 @@ vu_blk_get_config(VuDev *vu_dev, uint8_t *config,
> uint32_t len)
>      VuServer *server =3D container_of(vu_dev, VuServer, vu_dev);
>      VuBlkExport *vexp =3D container_of(server, VuBlkExport, vu_server);
>
> -    g_return_val_if_fail(len <=3D sizeof(struct virtio_blk_config), -1);
> +    if (len > sizeof(struct virtio_blk_config)) {
> +        error_report("Invalid get_config len %u, expected <=3D %zu",
> +                     len, sizeof(struct virtio_blk_config));
> +        return -1;
> +    }
>
>      memcpy(config, &vexp->blkcfg, len);
>      return 0;
> --
> 2.28.0
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000c636ba05b57d3a86
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 2, 2020 at 7:27 PM Stefan=
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
=C2=A0block/export/vhost-user-blk-server.c | 6 +++++-<br>
=C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user=
-blk-server.c<br>
index 62672d1cb9..bccbc98d57 100644<br>
--- a/block/export/vhost-user-blk-server.c<br>
+++ b/block/export/vhost-user-blk-server.c<br>
@@ -267,7 +267,11 @@ vu_blk_get_config(VuDev *vu_dev, uint8_t *config, uint=
32_t len)<br>
=C2=A0 =C2=A0 =C2=A0VuServer *server =3D container_of(vu_dev, VuServer, vu_=
dev);<br>
=C2=A0 =C2=A0 =C2=A0VuBlkExport *vexp =3D container_of(server, VuBlkExport,=
 vu_server);<br>
<br>
-=C2=A0 =C2=A0 g_return_val_if_fail(len &lt;=3D sizeof(struct virtio_blk_co=
nfig), -1);<br>
+=C2=A0 =C2=A0 if (len &gt; sizeof(struct virtio_blk_config)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Invalid get_config len %u, =
expected &lt;=3D %zu&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0len, sizeof(struct virtio_blk_config));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0memcpy(config, &amp;vexp-&gt;blkcfg, len);<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
-- <br>
2.28.0<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000c636ba05b57d3a86--

