Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A22BA2CD371
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 11:28:34 +0100 (CET)
Received: from localhost ([::1]:35834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kklqj-0001nl-OD
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 05:28:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kklog-0008Vg-Cq; Thu, 03 Dec 2020 05:26:26 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:35556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kkloc-0000HF-QP; Thu, 03 Dec 2020 05:26:24 -0500
Received: by mail-ej1-x644.google.com with SMTP id f23so2700492ejk.2;
 Thu, 03 Dec 2020 02:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VB6Qld4l2Nhzm4LaKEal+oZp1RIezoto+6VcIpf2R7s=;
 b=BnQXo2xl9jMbGaewXAEMpaGqVLMDrhi9nTIimY0xbPhas2oLHvqA1bhjeER0mCrd4K
 DR86BorKIob3mRcAQFGE96Hni0BTKvjmTWX2UjY2aog5xq8NDHcjNStrSAU2QyavZ5xn
 HUMaL+U71WTlLKACDjilesy0V0EnGZtsuCGfu6fPW4ngpfQe7yJPPNDph9E9se19JtZT
 wdrNlBonQ9+W4mt5zK/FU/fn5wXECZkKVCaXA1UAnkBU5AiuqT+ODzfgxYxyNWI4mOLH
 u9l+hZl2OY1/Tb+VexlmaepqxuGVABlQnmd2UfKUd0B6trQwWRQr7M4Or16KfKPzu2uf
 SZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VB6Qld4l2Nhzm4LaKEal+oZp1RIezoto+6VcIpf2R7s=;
 b=E79ezPD2EQ0y+LobLMGWym/BION2DmxteD6NIg49wA4pJu5JCL3ILHzWpK6r3GhXm5
 eQPuOrU+vQ+p7+WMQtRmxmIymPa9kL7mvdMk5fVgOB5Aj6fPwTLy77ZtC4a1X1MFvQsq
 D5yqBLlklZ47/2MOsnztp4kOq1HZtdb80FTbi+85msj2A5OvAxmEcqYRmAFjxwE7JiuR
 ccbM4nKipRHZ+Pbpfht4clZpKp+CRxU9S8ZR9FrTwVofhbKfV0FEB1hJLbHDYC+2vnll
 ox9KNVIjhuQWWdljGntADFDyWSbPKKV199OFJDdyJoG7N2i4pj1pUSM3+WTrxni5rif/
 Hj6w==
X-Gm-Message-State: AOAM531fFDcvmOG9Ae385+7+71NbNkiuePpOd6K/TWTsmcPqxlK1qL56
 U1gFRF1Ik3oDOI5C/TuYn/IV6fppr/XkiIPXA5E=
X-Google-Smtp-Source: ABdhPJzCt5jUjAU85eejuxsYOZXlWfFAVXIvml+Rk4JPJTsAvLZZbMgNuEWRUuKdNuEESS2gNJT+XHxr+m0H8EYGhhc=
X-Received: by 2002:a17:906:aacd:: with SMTP id
 kt13mr1805305ejb.527.1606991180529; 
 Thu, 03 Dec 2020 02:26:20 -0800 (PST)
MIME-Version: 1.0
References: <20201202152611.677753-1-stefanha@redhat.com>
 <20201202152611.677753-3-stefanha@redhat.com>
 <CAJ+F1CLrba5T02Dy1=dXSE4ye9rgHZ4r5S-mWwL-7UACeFLVuw@mail.gmail.com>
 <20201203095119.GA689053@stefanha-x1.localdomain>
In-Reply-To: <20201203095119.GA689053@stefanha-x1.localdomain>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 3 Dec 2020 14:26:08 +0400
Message-ID: <CAJ+F1CLwvE+6BhhpDaufitOHbbYv9XDQ6Yh=iwYzzVheueXPmA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] contrib/vhost-user-gpu: avoid g_return_val_if()
 input validation
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007904ee05b58cca6c"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x644.google.com
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

--0000000000007904ee05b58cca6c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 3, 2020 at 1:52 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Wed, Dec 02, 2020 at 07:50:51PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > On Wed, Dec 2, 2020 at 7:27 PM Stefan Hajnoczi <stefanha@redhat.com>
> wrote:
> >
> > > Do not validate input with g_return_val_if(). This API is intended fo=
r
> > > checking programming errors and is compiled out with
> -DG_DISABLE_CHECKS.
> > >
> > > Use an explicit if statement for input validation so it cannot
> > > accidentally be compiled out.
> > >
> > > Suggested-by: Markus Armbruster <armbru@redhat.com>
> > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > ---
> > >  contrib/vhost-user-gpu/vhost-user-gpu.c | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c
> > > b/contrib/vhost-user-gpu/vhost-user-gpu.c
> > > index a019d0a9ac..534bad24d1 100644
> > > --- a/contrib/vhost-user-gpu/vhost-user-gpu.c
> > > +++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
> > > @@ -1044,7 +1044,11 @@ vg_get_config(VuDev *dev, uint8_t *config,
> uint32_t
> > > len)
> > >  {
> > >      VuGpu *g =3D container_of(dev, VuGpu, dev.parent);
> > >
> > > -    g_return_val_if_fail(len <=3D sizeof(struct virtio_gpu_config), =
-1);
> > > +    if (len > sizeof(struct virtio_gpu_config)) {
> > > +        g_critical("%s: len %u is larger than %zu",
> > > +                   __func__, len, sizeof(struct virtio_gpu_config));
> > >
> >
> > g_critical() already has __FILE__ __LINE__ and G_STRFUNC.
>
> I did this for consistency with the logging in this source file. The
> other g_critical() calls in the file also print __func__.
>
>
>
I see, nevermind then. I gave rb anyway


--=20
Marc-Andr=C3=A9 Lureau

--0000000000007904ee05b58cca6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 3, 2020 at 1:52 PM Stefan=
 Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com">stefanha@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Wed, Dec 02, 2020 at 07:50:51PM +0400, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; On Wed, Dec 2, 2020 at 7:27 PM Stefan Hajnoczi &lt;<a href=3D"mailto:s=
tefanha@redhat.com" target=3D"_blank">stefanha@redhat.com</a>&gt; wrote:<br=
>
&gt; <br>
&gt; &gt; Do not validate input with g_return_val_if(). This API is intende=
d for<br>
&gt; &gt; checking programming errors and is compiled out with -DG_DISABLE_=
CHECKS.<br>
&gt; &gt;<br>
&gt; &gt; Use an explicit if statement for input validation so it cannot<br=
>
&gt; &gt; accidentally be compiled out.<br>
&gt; &gt;<br>
&gt; &gt; Suggested-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redh=
at.com" target=3D"_blank">armbru@redhat.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@red=
hat.com" target=3D"_blank">stefanha@redhat.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 contrib/vhost-user-gpu/vhost-user-gpu.c | 6 +++++-<br>
&gt; &gt;=C2=A0 1 file changed, 5 insertions(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c<br>
&gt; &gt; b/contrib/vhost-user-gpu/vhost-user-gpu.c<br>
&gt; &gt; index a019d0a9ac..534bad24d1 100644<br>
&gt; &gt; --- a/contrib/vhost-user-gpu/vhost-user-gpu.c<br>
&gt; &gt; +++ b/contrib/vhost-user-gpu/vhost-user-gpu.c<br>
&gt; &gt; @@ -1044,7 +1044,11 @@ vg_get_config(VuDev *dev, uint8_t *config,=
 uint32_t<br>
&gt; &gt; len)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 VuGpu *g =3D container_of(dev, VuGpu, dev.par=
ent);<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 g_return_val_if_fail(len &lt;=3D sizeof(struct vir=
tio_gpu_config), -1);<br>
&gt; &gt; +=C2=A0 =C2=A0 if (len &gt; sizeof(struct virtio_gpu_config)) {<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_critical(&quot;%s: len %u is large=
r than %zu&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__func__, len, sizeof(struct virtio_gpu_config));<br>
&gt; &gt;<br>
&gt; <br>
&gt; g_critical() already has __FILE__ __LINE__ and G_STRFUNC.<br>
<br>
I did this for consistency with the logging in this source file. The<br>
other g_critical() calls in the file also print __func__.<br><br><br></bloc=
kquote><div><br></div><div>I see, nevermind then. I gave rb anyway <br></di=
v></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"gmail_signat=
ure">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000007904ee05b58cca6c--

