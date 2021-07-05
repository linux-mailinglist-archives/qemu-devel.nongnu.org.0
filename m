Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBEE3BBB6E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:45:07 +0200 (CEST)
Received: from localhost ([::1]:35722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0M66-0002Wx-Rw
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m0M4J-00013l-FT
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:43:15 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:38576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m0M4G-0005oZ-SJ
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:43:15 -0400
Received: by mail-ed1-x536.google.com with SMTP id x12so23128484eds.5
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 03:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GjHJWJIRnxeXCQMpUGjxW3syGJ5yUtrMy5Qk8BrPAmI=;
 b=mK/+9vsxDgVzj+DfJdgaBFZuQTUxdgXXTGE2urv8zbJ1dgA86ameFxJDVCXWuQpA84
 C17fwj9iptjq6xTZ/atL9j/vjfhs2jdXQ9Elpf5ubk0HMjIty+jYPHdT/mYy+fvZz2Mr
 uxsFp5T0BhPVicRf4TbZlL8mH90DxE3F6czYzHjDOTbAtI5ltPyIZyCAHnPrxLOHd2+h
 OuHYX//ZclDLQ6H9/t8QmQA3oQ6anTPtSkpFmfVpkpj0W5JUf1j7UOwIEhgyF9QGvv0y
 FxjdoRTbMUZ5EgAzeKjhj//zo5TcB6cbWIVNduCiMQ6s/Yc61z2EmiohWYqZVFswPIDZ
 zYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GjHJWJIRnxeXCQMpUGjxW3syGJ5yUtrMy5Qk8BrPAmI=;
 b=C69pSsKv+HXTGgKCYzARo9Rum22Sv0vT+J4oSQt9v0QomHrwv1HdiESpO8YDZqWBhu
 fE8b96YgepbLfh3ZjdGVsdOOZ3C1VBtQ2BSq+cZF4ePLUbqfOMogHIpaj/6xSR4BErjy
 98zo/yPsrIs/z4bFfj2R4nIHkAurCkITiq+Bdxmoc22NMzxeGjKl1JNPVhj4fpaSTK36
 Fmsvs+EN9gZRzIO6Ggpqt3atIJY41RFvmBTUUf1fUqRjrRdnfkoSPVYm9e8nN47xF6yf
 sCxKu7TIfyfZgRC6jByoDaAumD6ICGOmfmuglaCU1fXr629ZQ/KPMrLF+CZXhzW6kXfw
 A4lg==
X-Gm-Message-State: AOAM530Z3/JiwC4uYhyPgckeiVbv5vjTRQqCvQ+dYW+Q7SNjQPxDTKiw
 RqFk2nh8gerlEDgoRUW2EyYmFuegAhoOD42KNrc=
X-Google-Smtp-Source: ABdhPJzpSVubXd+pjg8ZX4ht7cu2aaL3dHOHSVdKAJPUCDgqpZji4hzHB5UL8m/TYUceCiIPgpnpRCdlrCUc+Qv16Rw=
X-Received: by 2002:a50:fe95:: with SMTP id d21mr15581713edt.257.1625481790925; 
 Mon, 05 Jul 2021 03:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210701071837.738897-1-marcandre.lureau@redhat.com>
 <20210701071837.738897-2-marcandre.lureau@redhat.com>
 <5e843cd1-baf8-f457-f9cf-a314bc8dbfff@ilande.co.uk>
In-Reply-To: <5e843cd1-baf8-f457-f9cf-a314bc8dbfff@ilande.co.uk>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 5 Jul 2021 14:42:58 +0400
Message-ID: <CAJ+F1CJxqFQn71wX7FYQAx0f6DVjhrT69PkFA-F0gtG_fN5naA@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/display: fail early when multiple virgl devices
 are requested
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: multipart/alternative; boundary="000000000000bcb1ba05c65df87f"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x536.google.com
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

--000000000000bcb1ba05c65df87f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark

On Sat, Jul 3, 2021 at 9:15 AM Mark Cave-Ayland <
mark.cave-ayland@ilande.co.uk> wrote:

> On 01/07/2021 08:18, marcandre.lureau@redhat.com wrote:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > This avoids failing to initialize virgl and crashing later on, and clea=
r
> > the user expectations.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   hw/display/virtio-gpu-gl.c | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> >
> > diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
> > index d971b48080..c973d4824b 100644
> > --- a/hw/display/virtio-gpu-gl.c
> > +++ b/hw/display/virtio-gpu-gl.c
> > @@ -25,6 +25,8 @@
> >
> >   #include <virglrenderer.h>
> >
> > +static int virgl_count =3D 0;
> > +
> >   static void virtio_gpu_gl_update_cursor_data(VirtIOGPU *g,
> >                                                struct virtio_gpu_scanou=
t
> *s,
> >                                                uint32_t resource_id)
> > @@ -113,6 +115,11 @@ static void
> virtio_gpu_gl_device_realize(DeviceState *qdev, Error **errp)
> >       return;
> >   #endif
> >
> > +    if (virgl_count++ > 0) {
> > +        error_setg(errp, "multiple virgl devices aren't supported yet"=
);
> > +        return;
> > +    }
> > +
> >       if (!display_opengl) {
> >           error_setg(errp, "opengl is not available");
> >           return;
> > @@ -124,6 +131,10 @@ static void
> virtio_gpu_gl_device_realize(DeviceState *qdev, Error **errp)
> >
> >       virtio_gpu_device_realize(qdev, errp);
> >   }
> > +static void virtio_gpu_gl_device_unrealize(DeviceState *dev)
> > +{
> > +    virgl_count--;
> > +}
> >
> >   static Property virtio_gpu_gl_properties[] =3D {
> >       DEFINE_PROP_BIT("stats", VirtIOGPU, parent_obj.conf.flags,
> > @@ -144,6 +155,7 @@ static void virtio_gpu_gl_class_init(ObjectClass
> *klass, void *data)
> >       vgc->update_cursor_data =3D virtio_gpu_gl_update_cursor_data;
> >
> >       vdc->realize =3D virtio_gpu_gl_device_realize;
> > +    vdc->unrealize =3D virtio_gpu_gl_device_unrealize;
> >       vdc->reset =3D virtio_gpu_gl_reset;
> >       device_class_set_props(dc, virtio_gpu_gl_properties);
> >   }
>
> FWIW I think the best way to prevent instantiation of multiple devices is
> to use the
> QOM API to detect if more than one instance of a class exists within the
> QOM tree.
>
> Have a look at fw_cfg_find() and its usage from fw_cfg_common_realize() i=
n
> hw/nvram/fw_cfg.c for an example of this.
>

Good idea, I forgot about that trick. Sent "[PATCH v2] hw/display: fail
early when multiple virgl devices are requested".

thanks

--=20
Marc-Andr=C3=A9 Lureau

--000000000000bcb1ba05c65df87f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Mark<br></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 3, 2021 at 9:15 AM=
 Mark Cave-Ayland &lt;<a href=3D"mailto:mark.cave-ayland@ilande.co.uk">mark=
.cave-ayland@ilande.co.uk</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On 01/07/2021 08:18, <a href=3D"mailto:marcandre.l=
ureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<=
br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; This avoids failing to initialize virgl and crashing later on, and cle=
ar<br>
&gt; the user expectations.<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/display/virtio-gpu-gl.c | 12 ++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 12 insertions(+)<br>
&gt; <br>
&gt; diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c<b=
r>
&gt; index d971b48080..c973d4824b 100644<br>
&gt; --- a/hw/display/virtio-gpu-gl.c<br>
&gt; +++ b/hw/display/virtio-gpu-gl.c<br>
&gt; @@ -25,6 +25,8 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#include &lt;virglrenderer.h&gt;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static int virgl_count =3D 0;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static void virtio_gpu_gl_update_cursor_data(VirtIOGPU *g,=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_scanout *s,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t resource_id)<br>
&gt; @@ -113,6 +115,11 @@ static void virtio_gpu_gl_device_realize(DeviceSt=
ate *qdev, Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 if (virgl_count++ &gt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;multiple virgl dev=
ices aren&#39;t supported yet&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!display_opengl) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;opengl =
is not available&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; @@ -124,6 +131,10 @@ static void virtio_gpu_gl_device_realize(DeviceSt=
ate *qdev, Error **errp)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0virtio_gpu_device_realize(qdev, errp);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; +static void virtio_gpu_gl_device_unrealize(DeviceState *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 virgl_count--;<br>
&gt; +}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static Property virtio_gpu_gl_properties[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BIT(&quot;stats&quot;, VirtIOGPU=
, parent_obj.conf.flags,<br>
&gt; @@ -144,6 +155,7 @@ static void virtio_gpu_gl_class_init(ObjectClass *=
klass, void *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0vgc-&gt;update_cursor_data =3D virtio_gpu_gl=
_update_cursor_data;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0vdc-&gt;realize =3D virtio_gpu_gl_device_rea=
lize;<br>
&gt; +=C2=A0 =C2=A0 vdc-&gt;unrealize =3D virtio_gpu_gl_device_unrealize;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0vdc-&gt;reset =3D virtio_gpu_gl_reset;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0device_class_set_props(dc, virtio_gpu_gl_pro=
perties);<br>
&gt;=C2=A0 =C2=A0}<br>
<br>
FWIW I think the best way to prevent instantiation of multiple devices is t=
o use the <br>
QOM API to detect if more than one instance of a class exists within the QO=
M tree.<br>
<br>
Have a look at fw_cfg_find() and its usage from fw_cfg_common_realize() in =
<br>
hw/nvram/fw_cfg.c for an example of this.<br></blockquote><div><br></div><d=
iv>Good idea, I forgot about that trick. Sent &quot;[PATCH v2] hw/display: =
fail early when multiple virgl devices are requested&quot;.</div></div><div=
 class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">thanks<br></div=
><div><br></div><div>-- </div><div dir=3D"ltr" class=3D"gmail_signature">Ma=
rc-Andr=C3=A9 Lureau<br></div></div>

--000000000000bcb1ba05c65df87f--

