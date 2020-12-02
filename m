Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BAD2CC151
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 16:52:52 +0100 (CET)
Received: from localhost ([::1]:44264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkUR1-0000pf-AQ
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 10:52:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kkUPN-00005B-K5; Wed, 02 Dec 2020 10:51:09 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:35060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kkUPI-0007O1-NL; Wed, 02 Dec 2020 10:51:09 -0500
Received: by mail-ed1-x541.google.com with SMTP id u19so4474010edx.2;
 Wed, 02 Dec 2020 07:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B+VvBTRRX116/kkvC/NyWwUjZRmmOORT/n5Inx8MSw4=;
 b=n17eMVoMbXOqULx/9BhhOTFcr/JojGA+gUeV9ij2lHFzvTJxHagvevaGbOWNRuw4BI
 vMy/UbXTu5UxWFg1l6qxmboCV17x4sNSoh/1qSLE+So7fhgbtv1AXrr59Fw5gFHlQcgE
 1I17zcEKi3LZELj4WoG62JVeIyJoFAzd9F5y/FsGRsJAgZFZ2BJJvuc1xWownacvmFny
 V9nEwGNLmhpwrGQpzLjoOUM9Z26L2Sy+N7B0SUXSHcWVXQgvrFoxF2xcMVdVbhns2blh
 k9DmX6VOQZ+kYHF3zSSitv1irSMNIvzayFP0hqvqLJzAfjPmDeRo9oBQW0XAnpcDUf7U
 STQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B+VvBTRRX116/kkvC/NyWwUjZRmmOORT/n5Inx8MSw4=;
 b=VZ53ynt2f2Q1rPQhBXdVpWbNr0GMwdghDABuzqeHvRmHfeK6yMNuFqLnga/C/OFUNk
 zFzTGk4mbj0Md3vSEBYTi5MPEUuCeLN/f3CI3U11yn6SSSSvHFKlVB7so34w+wqaZLu2
 bhZ/6QKlgSXOvNprvxaftn9byS4KvARdJrR/g6wjIw7rQS1HNXcofUmkQFGBhGw8COqr
 nicOF8C17pHZd3MuCXJ9MpuWH44akqN7lHsAV2QxVuwkk9LabOQi+2RZaC9pFYM61m44
 UfbkLARTLITZEG3w1g0lBmL3DhW1FIGa/Nl8/c0FsRK2CM3BWw4iG9oj5pdfDFPz2frK
 hqFA==
X-Gm-Message-State: AOAM531fl2kdLhs/oM7LMaEN3XHcJlFpfyL8zrNQM/ZmZcHhZfTApqVj
 7gKw7+v6Dqw6YnA5PH3hfMC7kKPnBYJky4ThRUw=
X-Google-Smtp-Source: ABdhPJxGmWtJRCZVJOlKYu3QprggKvpW1lftIiLN6Y7DuHdQCxIUgRjWH/MU8r6ahzP50QVrNSbKiVPhgZOEi0Imvpo=
X-Received: by 2002:a50:a6de:: with SMTP id f30mr558306edc.30.1606924263088;
 Wed, 02 Dec 2020 07:51:03 -0800 (PST)
MIME-Version: 1.0
References: <20201202152611.677753-1-stefanha@redhat.com>
 <20201202152611.677753-3-stefanha@redhat.com>
In-Reply-To: <20201202152611.677753-3-stefanha@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 2 Dec 2020 19:50:51 +0400
Message-ID: <CAJ+F1CLrba5T02Dy1=dXSE4ye9rgHZ4r5S-mWwL-7UACeFLVuw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] contrib/vhost-user-gpu: avoid g_return_val_if()
 input validation
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e1e6cf05b57d3526"
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e1e6cf05b57d3526
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
> ---
>  contrib/vhost-user-gpu/vhost-user-gpu.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c
> b/contrib/vhost-user-gpu/vhost-user-gpu.c
> index a019d0a9ac..534bad24d1 100644
> --- a/contrib/vhost-user-gpu/vhost-user-gpu.c
> +++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
> @@ -1044,7 +1044,11 @@ vg_get_config(VuDev *dev, uint8_t *config, uint32_=
t
> len)
>  {
>      VuGpu *g =3D container_of(dev, VuGpu, dev.parent);
>
> -    g_return_val_if_fail(len <=3D sizeof(struct virtio_gpu_config), -1);
> +    if (len > sizeof(struct virtio_gpu_config)) {
> +        g_critical("%s: len %u is larger than %zu",
> +                   __func__, len, sizeof(struct virtio_gpu_config));
>

g_critical() already has __FILE__ __LINE__ and G_STRFUNC.

otherwise looks good:
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

+        return -1;
> +    }
>
>      if (opt_virgl) {
>          g->virtio_config.num_capsets =3D vg_virgl_get_num_capsets();
> --
> 2.28.0
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e1e6cf05b57d3526
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
arget=3D"_blank">stefanha@redhat.com</a>&gt;<br>
---<br>
=C2=A0contrib/vhost-user-gpu/vhost-user-gpu.c | 6 +++++-<br>
=C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-g=
pu/vhost-user-gpu.c<br>
index a019d0a9ac..534bad24d1 100644<br>
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c<br>
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c<br>
@@ -1044,7 +1044,11 @@ vg_get_config(VuDev *dev, uint8_t *config, uint32_t =
len)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0VuGpu *g =3D container_of(dev, VuGpu, dev.parent);<br>
<br>
-=C2=A0 =C2=A0 g_return_val_if_fail(len &lt;=3D sizeof(struct virtio_gpu_co=
nfig), -1);<br>
+=C2=A0 =C2=A0 if (len &gt; sizeof(struct virtio_gpu_config)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_critical(&quot;%s: len %u is larger than %zu=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__fun=
c__, len, sizeof(struct virtio_gpu_config));<br></blockquote><div><br></div=
><div>g_critical() already has __FILE__ __LINE__ and G_STRFUNC.</div><div><=
br></div><div>otherwise looks good:</div><div>Reviewed-by: Marc-Andr=C3=A9 =
Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@=
redhat.com</a>&gt; <br></div><div><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (opt_virgl) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g-&gt;virtio_config.num_capsets =3D vg_vi=
rgl_get_num_capsets();<br>
-- <br>
2.28.0<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000e1e6cf05b57d3526--

