Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C517D5E7C68
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 15:57:40 +0200 (CEST)
Received: from localhost ([::1]:46448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1objBT-0007K4-UB
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 09:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obj8O-0004LR-Qz
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 09:54:28 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:41740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obj8M-00037S-TL
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 09:54:28 -0400
Received: by mail-lf1-x133.google.com with SMTP id u18so376346lfo.8
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 06:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=W4O7Lq5+tCcoKXrVTfnwUP6DQmdvbWG7Zo4lkcRjHiY=;
 b=JAhfDnLN2o+vA2pE3RQk4kt6hii5zF3fjHtOWE0bngZH7Xz4YTaOJ465oO6bFyw29I
 ulruyh9lGWLFGkyVLbAQVwFD0fjiJA4CF6tV/PCqGEvKPzQYb6TjnlcxWbDtciL12Ck5
 i9aNVcMbJjNh49LbSO3pNmMU7j+klJtlyYrwlsAkRySwp8wCq2b2wTFB4XMzj5Jj+jsM
 0x64ZTK8IKXO8a16xpBo49AMCV0Ae30sGSyYGSw6fP/eUSjQ7J5jAo/lYtEvaUe8TWUu
 0b0RALPnLY41IjjZqxcNeN7vd7UqhFBNOrx6iVCRFCgYqUMHYdjhVGWO58h5GPqKHPq8
 qV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=W4O7Lq5+tCcoKXrVTfnwUP6DQmdvbWG7Zo4lkcRjHiY=;
 b=1IYk+2LREJQZHogWf+UjGQH1OX9GjRZ9qgPmRmSe1d43G8JeA9p3wKik+nis0njyBY
 JFQkKNLM6QnLmxvJ3v8WYf2ItUtt0CQUjmLwzrx1jHDve3vDexNVnK4axivAy5NFdCf7
 uLF2oXcyxKzhuEtdQJ4lQXhEeciK7oocYOycdBkDq/G+WsS/o1ogvT8anZ1t5AXmbCeu
 y0Y1xoO/R/e7i7x6egCE6Cid6Dl+622f0KB8XuYMi6kilCw3uPzxuRDpwRpe//t/ZbZG
 AfQpcMWpXwdJ0yQIGsloOOGSrjy0Py2fJOVLli5KG9ygTtZ1DHHiPLvcPnPsANW6vHPd
 CQLw==
X-Gm-Message-State: ACrzQf1bkzcS8GnwRTxUkqQyHsu6J8Ddf/TFNOcWkkBPY50HgjJfMIq1
 V2hjAiawUrhFF+ioaIRx1jJ5dXrrm78j7p5hrdM=
X-Google-Smtp-Source: AMsMyM5GhD56EKn187FYbH67vvvHy9R8mK4vElAh8+PVFSvUHxG8+p6WSD8qKqxiO+RX5edWApvQoiC+cW4B/N2ubBM=
X-Received: by 2002:a05:6512:6c9:b0:49a:51d4:d517 with SMTP id
 u9-20020a05651206c900b0049a51d4d517mr3427787lff.329.1663941265090; Fri, 23
 Sep 2022 06:54:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220923134350.324402-1-antonio.caggiano@collabora.com>
 <20220923134350.324402-2-antonio.caggiano@collabora.com>
In-Reply-To: <20220923134350.324402-2-antonio.caggiano@collabora.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 23 Sep 2022 15:54:13 +0200
Message-ID: <CAJ+F1CJGvOw3M4Ss73JStPTg+CH0n-ngmV0gqpstZUUzL-gP5A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] virtio-gpu: Unrealize
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Cc: qemu-devel@nongnu.org, gert.wollny@collabora.com, 
 dmitry.osipenko@collabora.com, "Michael S. Tsirkin" <mst@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000086fb505e95884e4"
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x133.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000086fb505e95884e4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Sep 23, 2022 at 3:45 PM Antonio Caggiano <
antonio.caggiano@collabora.com> wrote:

> Implement an unrealize function for virtio gpu device.
>
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> ---
>  hw/display/virtio-gpu.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index 20cc703dcc..412f0fb7ec 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -1345,6 +1345,15 @@ void virtio_gpu_device_realize(DeviceState *qdev,
> Error **errp)
>      QTAILQ_INIT(&g->fenceq);
>  }
>
> +void virtio_gpu_device_unrealize(DeviceState *qdev)
> +{
> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(qdev);
> +    VirtIOGPU *g =3D VIRTIO_GPU(qdev);
> +
> +    qemu_bh_delete(g->cursor_bh);
> +    qemu_bh_delete(g->ctrl_bh);
>

It also needs to call virtio_gpu_base_device_unrealize() (or save the
function in class_init, as shown in
https://www.qemu.org/docs/master/devel/qom.html?highlight=3Dparent_do_somet=
hing#id5
- although I find it cumbersome)

Otherwise, lgtm

+}
> +
>  void virtio_gpu_reset(VirtIODevice *vdev)
>  {
>      VirtIOGPU *g =3D VIRTIO_GPU(vdev);
> @@ -1440,6 +1449,7 @@ static void virtio_gpu_class_init(ObjectClass
> *klass, void *data)
>      vgbc->gl_flushed =3D virtio_gpu_handle_gl_flushed;
>
>      vdc->realize =3D virtio_gpu_device_realize;
> +    vdc->unrealize =3D virtio_gpu_device_unrealize;
>      vdc->reset =3D virtio_gpu_reset;
>      vdc->get_config =3D virtio_gpu_get_config;
>      vdc->set_config =3D virtio_gpu_set_config;
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000086fb505e95884e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 23, 2022 at 3:45 PM Ant=
onio Caggiano &lt;<a href=3D"mailto:antonio.caggiano@collabora.com">antonio=
.caggiano@collabora.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Implement an unrealize function for virtio gpu devic=
e.<br>
<br>
Signed-off-by: Antonio Caggiano &lt;<a href=3D"mailto:antonio.caggiano@coll=
abora.com" target=3D"_blank">antonio.caggiano@collabora.com</a>&gt;<br>
---<br>
=C2=A0hw/display/virtio-gpu.c | 10 ++++++++++<br>
=C2=A01 file changed, 10 insertions(+)<br>
<br>
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c<br>
index 20cc703dcc..412f0fb7ec 100644<br>
--- a/hw/display/virtio-gpu.c<br>
+++ b/hw/display/virtio-gpu.c<br>
@@ -1345,6 +1345,15 @@ void virtio_gpu_device_realize(DeviceState *qdev, Er=
ror **errp)<br>
=C2=A0 =C2=A0 =C2=A0QTAILQ_INIT(&amp;g-&gt;fenceq);<br>
=C2=A0}<br>
<br>
+void virtio_gpu_device_unrealize(DeviceState *qdev)<br>
+{<br>
+=C2=A0 =C2=A0 VirtIODevice *vdev =3D VIRTIO_DEVICE(qdev);<br>
+=C2=A0 =C2=A0 VirtIOGPU *g =3D VIRTIO_GPU(qdev);<br>
+<br>
+=C2=A0 =C2=A0 qemu_bh_delete(g-&gt;cursor_bh);<br>
+=C2=A0 =C2=A0 qemu_bh_delete(g-&gt;ctrl_bh);<br></blockquote><div><br></di=
v><div>It also needs to call virtio_gpu_base_device_unrealize() (or save th=
e function in class_init, as shown in <a href=3D"https://www.qemu.org/docs/=
master/devel/qom.html?highlight=3Dparent_do_something#id5">https://www.qemu=
.org/docs/master/devel/qom.html?highlight=3Dparent_do_something#id5</a> - a=
lthough I find it cumbersome)</div><div><br></div><div>Otherwise, lgtm<br><=
/div><div><br> </div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+}<br>
+<br>
=C2=A0void virtio_gpu_reset(VirtIODevice *vdev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0VirtIOGPU *g =3D VIRTIO_GPU(vdev);<br>
@@ -1440,6 +1449,7 @@ static void virtio_gpu_class_init(ObjectClass *klass,=
 void *data)<br>
=C2=A0 =C2=A0 =C2=A0vgbc-&gt;gl_flushed =3D virtio_gpu_handle_gl_flushed;<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0vdc-&gt;realize =3D virtio_gpu_device_realize;<br>
+=C2=A0 =C2=A0 vdc-&gt;unrealize =3D virtio_gpu_device_unrealize;<br>
=C2=A0 =C2=A0 =C2=A0vdc-&gt;reset =3D virtio_gpu_reset;<br>
=C2=A0 =C2=A0 =C2=A0vdc-&gt;get_config =3D virtio_gpu_get_config;<br>
=C2=A0 =C2=A0 =C2=A0vdc-&gt;set_config =3D virtio_gpu_set_config;<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000086fb505e95884e4--

