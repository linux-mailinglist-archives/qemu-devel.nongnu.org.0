Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEF43BBBFD
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 13:09:44 +0200 (CEST)
Received: from localhost ([::1]:38618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0MTv-00081I-Jm
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 07:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m0MSz-0007Ke-HI
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 07:08:45 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:45925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m0MSv-0000em-Lq
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 07:08:45 -0400
Received: by mail-ed1-x531.google.com with SMTP id t3so23187081edt.12
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 04:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6oHE2cJR3rHDeNE5t4hRkydyyq1Z91w2QMRcKL99Ma0=;
 b=ojV4mXM6tgp4r9KwIWPuyTjMRnLZAOvGysBRO4skkzzhgBCKFe1/6me1JMCzGWXtj3
 lWMmFwwPx1JWpBTOE/oeHFk1waQt0Za6rdM6ZQr8dXjC+SpqBaZKUBGooQn3EHVirAG9
 9cnmfBIAjUzE2k4aJVJn+Nvi4oVrFLfD/70cVr/OApqVRXSlbghMBeHLtv2FaWZsxDao
 YEzbbqi9XYEZokqB7GXSy6xppsrOU4jkpmMefOCOAdCPB0TGhSc2OfPaw7smqybKCAQj
 +kZp54GGEDM9ClwxXGrRdHx2ZG/IEA9wrILNRTKn7GsUiXZHMtutSQpcZr2sip9pATwq
 pNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6oHE2cJR3rHDeNE5t4hRkydyyq1Z91w2QMRcKL99Ma0=;
 b=LsdhaBWeqo75dVfnpiXUr6O5JJhNla4IspdYCp+4F74PTTmIywDCposD7PxfyUIxCE
 x+YB/XRFhJz5i7s+KK/DMP5n8GbYaFWmIVA/V5Y0xkQvZ4FF2PZG1lPV3BEFzbd6ZuxT
 91ix6Oe0QYI6ITJcayekdDuvseOZN+Ug+09956STxKsCIv5u0M7ReP0A6g54p4I3LAqB
 z2FHE1Ue5k+C+XzbwyIB636dRPgQ6eare1twsRNHqweTUo+7mCtTAx4MoGbEwauKi/X7
 YNtKS4JJP0hoztKVh9n2WR/66A9l0EV0geKaMyTYhvEYRdebk4kcWbT+oTqWth9VhxGl
 j7tQ==
X-Gm-Message-State: AOAM533mhyH+xlLqOwgNY6sWhfNmUulMl6Jy3cNvUUteMSd3C06PLd/7
 IURf81b2vNnlUnWZrTB7Asbsq1i8oivOSdl0KNA=
X-Google-Smtp-Source: ABdhPJxBl6Vx6rwbd/qE5XRb5UMSZEitl8NTE2pJmUzwIBT/lRm04/F2oJFVNROq4GNs+4ehEugp9dLbF33dsHdziTM=
X-Received: by 2002:aa7:d0c9:: with SMTP id u9mr12207263edo.245.1625483319987; 
 Mon, 05 Jul 2021 04:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210705104218.1161101-1-marcandre.lureau@redhat.com>
 <dd6a8650-0507-49eb-4a13-2c0356b7f3d1@redhat.com>
In-Reply-To: <dd6a8650-0507-49eb-4a13-2c0356b7f3d1@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 5 Jul 2021 15:08:28 +0400
Message-ID: <CAJ+F1CLWfv6vdiF33MKCNMQ7k_-1Eg+8dn_RLYnN+CTmdGJmGQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/display: fail early when multiple virgl devices are
 requested
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e0516605c65e530b"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x531.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e0516605c65e530b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Jul 5, 2021 at 3:03 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om>
wrote:

> On 7/5/21 12:42 PM, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > This avoids failing to initialize virgl and crashing later on, and clea=
r
> > the user expectations.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  hw/display/virtio-gpu-gl.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
> > index aea9700d5c..bc55c4767e 100644
> > --- a/hw/display/virtio-gpu-gl.c
> > +++ b/hw/display/virtio-gpu-gl.c
> > @@ -113,6 +113,11 @@ static void
> virtio_gpu_gl_device_realize(DeviceState *qdev, Error **errp)
> >      return;
> >  #endif
> >
> > +    if (!object_resolve_path_type("", TYPE_VIRTIO_GPU_GL, NULL)) {
>
> Isn't the condition inverted?
>

No, it's easy to misread though. It returns NULL if there are no or
multiple instances.

When realize() is reached the first time, we should have only one instance,
and thus !NULL.


> > +        error_setg(errp, "at most one %s device is permitted",
> TYPE_VIRTIO_GPU_GL);
> > +        return;
> > +    }
> > +
> >      if (!display_opengl) {
> >          error_setg(errp, "opengl is not available");
> >          return;
> >
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e0516605c65e530b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 5, 2021 at 3:03 PM Phil=
ippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On 7/5/21 12:42 PM, <a href=3D"mailto:marcandre.lureau@redhat.com" t=
arget=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
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
&gt;=C2=A0 hw/display/virtio-gpu-gl.c | 5 +++++<br>
&gt;=C2=A0 1 file changed, 5 insertions(+)<br>
&gt; <br>
&gt; diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c<b=
r>
&gt; index aea9700d5c..bc55c4767e 100644<br>
&gt; --- a/hw/display/virtio-gpu-gl.c<br>
&gt; +++ b/hw/display/virtio-gpu-gl.c<br>
&gt; @@ -113,6 +113,11 @@ static void virtio_gpu_gl_device_realize(DeviceSt=
ate *qdev, Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 if (!object_resolve_path_type(&quot;&quot;, TYPE_VIRTIO=
_GPU_GL, NULL)) {<br>
<br>
Isn&#39;t the condition inverted?<br></blockquote><div><br></div><div>No, i=
t&#39;s easy to misread though. It returns NULL if there are no or multiple=
 instances.</div><div><br></div><div>When realize() is reached the first ti=
me, we should have only one instance, and thus !NULL.<br></div><div> <br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;at most one %s dev=
ice is permitted&quot;, TYPE_VIRTIO_GPU_GL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!display_opengl) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;opengl is not=
 available&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; <br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000e0516605c65e530b--

