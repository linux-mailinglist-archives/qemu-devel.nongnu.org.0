Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA4351D2A4
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 09:54:58 +0200 (CEST)
Received: from localhost ([::1]:41390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmsnh-0000dm-3P
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 03:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nmsmP-0008MA-Hl
 for qemu-devel@nongnu.org; Fri, 06 May 2022 03:53:37 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:35535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nmsmN-00040j-W9
 for qemu-devel@nongnu.org; Fri, 06 May 2022 03:53:37 -0400
Received: by mail-lf1-x12d.google.com with SMTP id h29so11255406lfj.2
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 00:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JtVy8osQD4yWEUc1A/gOePecndoIJ4+dMPdbHQtICwE=;
 b=Y8t+o94hGUpVs+tjzLDtsRdcgt/bfhL7MuPrMY3F1tNDDrPMEciDyzPpL/J7EL3syQ
 t8ijircSaTOYt8DCGFrKafLuuex0LyeFHQdL4XMsyzFE8VCGZl2Pbg8TetGuiz8qZHZJ
 OfW38zqMyQORYaOF/ZwCC6muimUOMAkjrC/oVlQkSqSawg8JG8jhz6ZZMbkEVTku8RAj
 jOOt4WP6IepgGUoF4L8k7Un7sfYTqLKnM7YBDqckCe3tVtuaOBfsaXef0xKcmk2jEk5B
 l4O/Ir6YvXfcSE3cfDeUvXjReT/l0pzG/AhjPpjPRR7G5jdIef84hkQOpDRITt3WrV8n
 W2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JtVy8osQD4yWEUc1A/gOePecndoIJ4+dMPdbHQtICwE=;
 b=IDkJ6sDFNLiTOIon4FELnPcfPWsNY0Xzd99qnogabiiQmGSI+szs3q8hI8uZR/yCZq
 dF8OBZ3CHseTT9/7MkADPSWOk4rKxGS+SkPxvEVlIowA+ryuwC6t3QP/1K6cN2U3bSqv
 PSwGpH/oy+QgSgu59qnwbEnigigYs2nLVT+8LaIIj/RUTGvH3IeEMo6ISDrzNsKptNRK
 wirfqBRCHUHn7xJ7dge1y8NRsQfZN1UGd8TGNglQCdttJMhSvupX42gm0eBEA89fV/bb
 FEWtbcw/uRkR3m+zJCHvPL0AeuflfJNDDNC+/eV6co1tbsoZjKMTb2YQ7TiQNHCxTFSi
 +fWw==
X-Gm-Message-State: AOAM531OVU31+Er+RcR74M1jmtYR3dhPxEaqcNRUCORCbyvH32LveHxk
 o16VIj0eYMXhVsYNYwiwP/ylRchW/8gpJ7XHB/M=
X-Google-Smtp-Source: ABdhPJwDuivXByxMj09AOnJT8IIpexoVF8Dl4JlWkwsCBaLSI7l8IlydNxbl38LzfoxHgcERCJIuaj53bOl5RGU81NU=
X-Received: by 2002:a05:6512:b9b:b0:473:e0a4:77eb with SMTP id
 b27-20020a0565120b9b00b00473e0a477ebmr1696429lfv.507.1651823614129; Fri, 06
 May 2022 00:53:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220505214030.4261-1-dongwon.kim@intel.com>
In-Reply-To: <20220505214030.4261-1-dongwon.kim@intel.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 6 May 2022 11:53:22 +0400
Message-ID: <CAJ+F1CJ_vLG31zk9y2rphOy3y+NhVkn1VSriSXYv4mXCbFEWJQ@mail.gmail.com>
Subject: Re: [PATCH] virtio-gpu: update done only on the scanout associated
 with rect
To: Dongwon Kim <dongwon.kim@intel.com>
Cc: QEMU <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Content-Type: multipart/alternative; boundary="000000000000c07b5b05de53277a"
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12d.google.com
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

--000000000000c07b5b05de53277a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, May 6, 2022 at 1:46 AM Dongwon Kim <dongwon.kim@intel.com> wrote:

> It only needs to update the scanouts containing the rect area
> coming with the resource-flush request from the guest.
>
>
Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> ---
>  hw/display/virtio-gpu.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index 529b5246b2..165ecafd7a 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -514,6 +514,9 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
>          for (i =3D 0; i < g->parent_obj.conf.max_outputs; i++) {
>              scanout =3D &g->parent_obj.scanout[i];
>              if (scanout->resource_id =3D=3D res->resource_id &&
> +                rf.r.x >=3D scanout->x && rf.r.y >=3D scanout->y &&
> +                rf.r.x + rf.r.width <=3D scanout->x + scanout->width &&
> +                rf.r.y + rf.r.height <=3D scanout->y + scanout->height &=
&
>


That doesn't seem to handle intersections/overlapping, I think it should.


>                  console_has_gl(scanout->con)) {
>                  dpy_gl_update(scanout->con, 0, 0, scanout->width,
>                                scanout->height);
> --
> 2.30.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000c07b5b05de53277a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 6, 2022 at 1:46 AM Dong=
won Kim &lt;<a href=3D"mailto:dongwon.kim@intel.com">dongwon.kim@intel.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I=
t only needs to update the scanouts containing the rect area<br>
coming with the resource-flush request from the guest.<br>=C2=A0 <br></bloc=
kquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
Cc: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank=
">kraxel@redhat.com</a>&gt;<br>
Cc: Vivek Kasireddy &lt;<a href=3D"mailto:vivek.kasireddy@intel.com" target=
=3D"_blank">vivek.kasireddy@intel.com</a>&gt;<br>
Signed-off-by: Dongwon Kim &lt;<a href=3D"mailto:dongwon.kim@intel.com" tar=
get=3D"_blank">dongwon.kim@intel.com</a>&gt;<br>
---<br>
=C2=A0hw/display/virtio-gpu.c | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c<br>
index 529b5246b2..165ecafd7a 100644<br>
--- a/hw/display/virtio-gpu.c<br>
+++ b/hw/display/virtio-gpu.c<br>
@@ -514,6 +514,9 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; g-&gt;parent_obj.con=
f.max_outputs; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scanout =3D &amp;g-&gt;pare=
nt_obj.scanout[i];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (scanout-&gt;resource_id=
 =3D=3D res-&gt;resource_id &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rf.r.x &gt;=3D sca=
nout-&gt;x &amp;&amp; rf.r.y &gt;=3D scanout-&gt;y &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rf.r.x + rf.r.widt=
h &lt;=3D scanout-&gt;x + scanout-&gt;width &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rf.r.y + rf.r.heig=
ht &lt;=3D scanout-&gt;y + scanout-&gt;height &amp;&amp;<br></blockquote><d=
iv><br></div><div><div><br></div><div>That doesn&#39;t seem to handle inter=
sections/overlapping, I think it should.</div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0console_has_g=
l(scanout-&gt;con)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpy_gl_update=
(scanout-&gt;con, 0, 0, scanout-&gt;width,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scanout-&gt;height);<br>
-- <br>
2.30.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000c07b5b05de53277a--

