Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3905B6B38
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 11:55:49 +0200 (CEST)
Received: from localhost ([::1]:34602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY2dw-0001Js-Ou
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 05:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oY2Ty-0003N2-88
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 05:45:32 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:45944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oY2Tv-0007AO-T8
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 05:45:29 -0400
Received: by mail-lj1-x22f.google.com with SMTP id c7so2290928ljm.12
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 02:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=VMSKcv+0+y/N1AvPgMImqlIcoBM/UPsrLt3PSg5oBK8=;
 b=gMKEb2kHhYqDg9FNS5fxyMjCOKU/FxF16947aqwaz4EakouXzp8kd6/U5DsIeFBud1
 3QRqFXXTf3fEQNfDkPEeT3lA1/Gj7O/n5q5iPP2bOQTmQ+jmHAXqfpMcOJ8Yjhvm2XmE
 W9b+rKljgNC5PS/pUextffxpRNtqpcBU122mGJLqlk/H6aQE4ZlahKxrbS+mcM81jLHt
 I2I5e+bSTSs/HyorQATR5AD01CYD/vbuqVuIHJka02kcIt10mNZ3mV8mAJjRy6N7ISPu
 zMVRFMQ+qQd08EVR/1Vas7LhxNi1M7Tao4I44mMvmMA6D72/ON/3522O27s615ordHzS
 YgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=VMSKcv+0+y/N1AvPgMImqlIcoBM/UPsrLt3PSg5oBK8=;
 b=wJpPiX5Z9Q9WxoWMQFJYeTE/n8n5bLFUg7Jma/fuiS7qu3n+91Uo2/plF6eq+aQWjc
 bRU32yKaybjXxahs+fpWpirKo5HBaYTngadmegiusGx8aMIAhZh8ZKsZVmCoO9IuOjaQ
 MCJynKLVDhzaQgSVgoYii3ijxi6ZP2AwIn9ZOeqaTtm8U0T4ByOVIMjcgUm+vzWx9x2j
 5jACi/3AQVBJROrdoFMSv/NitfGt7fMzWpbQOGBejD8+OqOBGbpPJXKZf2ENf71szxcu
 Wy0F2yi38DeLy1uGPxrDzDP3rdygkXh2keb/UzImdi6hNkgvJv6rhhpV8vG5dgUfmIN/
 aHZg==
X-Gm-Message-State: ACgBeo0zcVivgbUx/trymR+0MQmFMxNRlcMzYt99QoeOr4eDZTI0EkRe
 aZo75sE0IQwp1/a3IPEfqOySrcOTSKAO6Ke1O98=
X-Google-Smtp-Source: AA6agR5DIy08SPLdAGRq63Un9SkmhaWAkvb7crTiCE955BkLtizatt9hZoJD8aI5kjdOKHbROmk7GEbQyYWidp+eMb0=
X-Received: by 2002:a2e:8917:0:b0:26a:a520:db52 with SMTP id
 d23-20020a2e8917000000b0026aa520db52mr8647804lji.289.1663062325520; Tue, 13
 Sep 2022 02:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220909014052.7297-1-dongwon.kim@intel.com>
In-Reply-To: <20220909014052.7297-1-dongwon.kim@intel.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 13 Sep 2022 13:45:13 +0400
Message-ID: <CAJ+F1CK-NMGyZTKJqo=gqigPAnku3vXabcbfR8SPmW09TCOw7A@mail.gmail.com>
Subject: Re: [PATCH] virtio-gpu: update scanout if there is any area covered
 by the rect
To: Dongwon Kim <dongwon.kim@intel.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000026f25005e88bdf50"
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--00000000000026f25005e88bdf50
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 9, 2022 at 5:50 AM Dongwon Kim <dongwon.kim@intel.com> wrote:

> The scanout is currently updated only if the whole rect is inside the
> scanout space. This is not a correct condition because the scanout should
> be updated even a small area in the scanout space is covered by the rect.
>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  hw/display/virtio-gpu.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index 20cc703dcc..5e15c79b94 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -515,9 +515,10 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
>          for (i =3D 0; i < g->parent_obj.conf.max_outputs; i++) {
>              scanout =3D &g->parent_obj.scanout[i];
>              if (scanout->resource_id =3D=3D res->resource_id &&
> -                rf.r.x >=3D scanout->x && rf.r.y >=3D scanout->y &&
> -                rf.r.x + rf.r.width <=3D scanout->x + scanout->width &&
> -                rf.r.y + rf.r.height <=3D scanout->y + scanout->height &=
&
> +                rf.r.x < scanout->x + scanout->width &&
> +                rf.r.x + rf.r.width >=3D scanout->x &&
> +                rf.r.y < scanout->y + scanout->height &&
> +                rf.r.y + rf.r.height >=3D scanout->y &&
>                  console_has_gl(scanout->con)) {
>                  dpy_gl_update(scanout->con, 0, 0, scanout->width,
>                                scanout->height);
> --
> 2.20.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000026f25005e88bdf50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 9, 2022 at 5:50 AM Dongwo=
n Kim &lt;<a href=3D"mailto:dongwon.kim@intel.com">dongwon.kim@intel.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The=
 scanout is currently updated only if the whole rect is inside the<br>
scanout space. This is not a correct condition because the scanout should<b=
r>
be updated even a small area in the scanout space is covered by the rect.<b=
r>
<br>
Cc: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank=
">kraxel@redhat.com</a>&gt;<br>
Signed-off-by: Dongwon Kim &lt;<a href=3D"mailto:dongwon.kim@intel.com" tar=
get=3D"_blank">dongwon.kim@intel.com</a>&gt;<br></blockquote><div><br></div=
><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.l=
ureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/display/virtio-gpu.c | 7 ++++---<br>
=C2=A01 file changed, 4 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c<br>
index 20cc703dcc..5e15c79b94 100644<br>
--- a/hw/display/virtio-gpu.c<br>
+++ b/hw/display/virtio-gpu.c<br>
@@ -515,9 +515,10 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; g-&gt;parent_obj.con=
f.max_outputs; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scanout =3D &amp;g-&gt;pare=
nt_obj.scanout[i];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (scanout-&gt;resource_id=
 =3D=3D res-&gt;resource_id &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rf.r.x &gt;=3D sca=
nout-&gt;x &amp;&amp; rf.r.y &gt;=3D scanout-&gt;y &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rf.r.x + rf.r.widt=
h &lt;=3D scanout-&gt;x + scanout-&gt;width &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rf.r.y + rf.r.heig=
ht &lt;=3D scanout-&gt;y + scanout-&gt;height &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rf.r.x &lt; scanou=
t-&gt;x + scanout-&gt;width &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rf.r.x + rf.r.widt=
h &gt;=3D scanout-&gt;x &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rf.r.y &lt; scanou=
t-&gt;y + scanout-&gt;height &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rf.r.y + rf.r.heig=
ht &gt;=3D scanout-&gt;y &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0console_has_g=
l(scanout-&gt;con)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpy_gl_update=
(scanout-&gt;con, 0, 0, scanout-&gt;width,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scanout-&gt;height);<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000026f25005e88bdf50--

