Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6C23B8492
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 15:59:32 +0200 (CEST)
Received: from localhost ([::1]:57152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyakV-0004hD-Qw
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 09:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuval.shaia.ml@gmail.com>)
 id 1lyahm-0002BD-2Y
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 09:56:42 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:44809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuval.shaia.ml@gmail.com>)
 id 1lyahi-0001cK-Nu
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 09:56:41 -0400
Received: by mail-lf1-x132.google.com with SMTP id a11so5231545lfg.11
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 06:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z03D2JSzBfVLdeJPOAUVD6ydq1aenXB8ml55Cn9XL+I=;
 b=cOBr/pDbeIzSG4kaH1zePaJFpMArszm7uGaujijYTkcOZ2rkL57VNgiTNzpz4cVE0J
 0J2AwahYymn0WvJCe+5wox6vQoE/7adlb0LtwjuJNLukWs3lMg09KUJLJndAObllVmqL
 oNaE2y1tECotlyRVwV2lc7+IbeOqdVC0w6nxH5whTLAvFXWq5xn+xfhO8KwvfpWhqEOV
 v5muwE/opXzQeUV2MbZ1OwH63Ifs8ShdGqaWhcGDv+NcBdW/VJxm8bL1/aC/k8wDZajA
 secKcnMePacXZm0Z9K02nSvIy1qPVbYj4/HZCjXKwoSusTAJg38xXhIH68PzX8BxCtAO
 DJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z03D2JSzBfVLdeJPOAUVD6ydq1aenXB8ml55Cn9XL+I=;
 b=ep8b/ITefJhM5WgrVKPBjwxpuaRwSyW2e8+rDOOTrOWxj76QRj2siR4bZ7ehO0oXk0
 Uj0WpiEAZx38Zta5/TScA3KOmypMuA45hTFFgoazYZrPIk8I6hfPLrtJ1oHAsRD5zInA
 dVSutK3pEejDoUNBhTnFqzPUYk4TlY6guoGLz0whWLkq+O1iv1nHafFt96RYl0l4MQVc
 852NrBUnTmWll2P8/Sro0PTJBnI2YbBwJsB74/emgj07WZu6sDI3JIFm0S9o4lobF/9C
 0uYVW/V+LyfP8TiHTM0nk8Y3Y+ATWhPtTcTLgnL0DC3DZ7CCMuq03HSFWYEntDSV9o6D
 vFGA==
X-Gm-Message-State: AOAM531K9vUYmf9AdD22f4nO/GMU+4C3gn7rVcjTX8CM/jh5taj59+xQ
 z1dXC4GqE+7pqrSlHGg5qzSQfcl3JvBcpsKeuDk=
X-Google-Smtp-Source: ABdhPJxdMskVhkb6Au+ovQzM6NORhgFo26TD6W5pTst8bWgdXs3tSMuxq50qz/y4rm6TKYfXZegOyl5EveFQAtfM4Ek=
X-Received: by 2002:ac2:5a06:: with SMTP id q6mr27845465lfn.283.1625061394182; 
 Wed, 30 Jun 2021 06:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210630115246.2178219-1-marcel@redhat.com>
In-Reply-To: <20210630115246.2178219-1-marcel@redhat.com>
From: Yuval Shaia <yuval.shaia.ml@gmail.com>
Date: Wed, 30 Jun 2021 16:56:19 +0300
Message-ID: <CAMPkWoMbhAt6K=PS32BoXHGPQOCRtgWrjJtrH1x8v19xthkHQQ@mail.gmail.com>
Subject: Re: [PATCH] pvrdma: Fix the ring init error flow (CVE-2021-3608)
To: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000023748705c5fc172a"
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=yuval.shaia.ml@gmail.com; helo=mail-lf1-x132.google.com
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
Cc: marcel@redhat.com, vv474172261@gmail.com, mcascell@redhat.com,
 pj.pandit@yahoo.co.in, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000023748705c5fc172a
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Jun 2021 at 14:52, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
wrote:

> Do not unmap uninitialized dma addresses.
>
> Fixes: CVE-2021-3608
> Reviewed-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
> Tested-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
> Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
> ---
>  hw/rdma/vmw/pvrdma_dev_ring.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/rdma/vmw/pvrdma_dev_ring.c b/hw/rdma/vmw/pvrdma_dev_ring.c
> index 074ac59b84..42130667a7 100644
> --- a/hw/rdma/vmw/pvrdma_dev_ring.c
> +++ b/hw/rdma/vmw/pvrdma_dev_ring.c
> @@ -41,7 +41,7 @@ int pvrdma_ring_init(PvrdmaRing *ring, const char *name,
> PCIDevice *dev,
>      qatomic_set(&ring->ring_state->cons_head, 0);
>      */
>      ring->npages = npages;
> -    ring->pages = g_malloc(npages * sizeof(void *));
> +    ring->pages = g_malloc0(npages * sizeof(void *));
>
>
Reviewed-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
Tested-by: Yuval Shaia <yuval.shaia.ml@gmail.com>


>      for (i = 0; i < npages; i++) {
>          if (!tbl[i]) {
> --
> 2.31.1
>
>

--00000000000023748705c5fc172a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 30 Jun 2021 at 14:52, Marcel =
Apfelbaum &lt;<a href=3D"mailto:marcel.apfelbaum@gmail.com">marcel.apfelbau=
m@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Do not unmap uninitialized dma addresses.<br>
<br>
Fixes: CVE-2021-3608<br>
Reviewed-by: VictorV (Kunlun Lab) &lt;<a href=3D"mailto:vv474172261@gmail.c=
om" target=3D"_blank">vv474172261@gmail.com</a>&gt;<br>
Tested-by: VictorV (Kunlun Lab) &lt;<a href=3D"mailto:vv474172261@gmail.com=
" target=3D"_blank">vv474172261@gmail.com</a>&gt;<br>
Signed-off-by: Marcel Apfelbaum &lt;<a href=3D"mailto:marcel@redhat.com" ta=
rget=3D"_blank">marcel@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/rdma/vmw/pvrdma_dev_ring.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/hw/rdma/vmw/pvrdma_dev_ring.c b/hw/rdma/vmw/pvrdma_dev_ring.c<=
br>
index 074ac59b84..42130667a7 100644<br>
--- a/hw/rdma/vmw/pvrdma_dev_ring.c<br>
+++ b/hw/rdma/vmw/pvrdma_dev_ring.c<br>
@@ -41,7 +41,7 @@ int pvrdma_ring_init(PvrdmaRing *ring, const char *name, =
PCIDevice *dev,<br>
=C2=A0 =C2=A0 =C2=A0qatomic_set(&amp;ring-&gt;ring_state-&gt;cons_head, 0);=
<br>
=C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0ring-&gt;npages =3D npages;<br>
-=C2=A0 =C2=A0 ring-&gt;pages =3D g_malloc(npages * sizeof(void *));<br>
+=C2=A0 =C2=A0 ring-&gt;pages =3D g_malloc0(npages * sizeof(void *));<br>
<br></blockquote><div><br></div>Reviewed-by: Yuval Shaia &lt;<a href=3D"mai=
lto:yuval.shaia.ml@gmail.com" target=3D"_blank">yuval.shaia.ml@gmail.com</a=
>&gt;<br><div>Tested-by: Yuval Shaia &lt;<a href=3D"mailto:yuval.shaia.ml@g=
mail.com" target=3D"_blank">yuval.shaia.ml@gmail.com</a>&gt;=C2=A0=C2=A0</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; npages; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!tbl[i]) {<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--00000000000023748705c5fc172a--

