Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C827C577C83
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 09:24:16 +0200 (CEST)
Received: from localhost ([::1]:60358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDL71-0001cE-WA
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 03:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDL57-0008Fe-CS
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 03:22:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDL55-0006jU-JM
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 03:22:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658128935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fXKs0Su32/6Nm8nN5u8HEw5FRDFan4AlrF2o703Uj1I=;
 b=OSOn8qY589uCzLE+dm7/8pEh5aIrPU9OXoP3i2iRdDxQu3HwpayUv+Xlj/AXRiQrya70G/
 iKm2Kek1JqnyM9nxJW9rrJ/w7UmF5cZoKAbM8tDCbNm6eEfqEtz38fecINqkwDM29qJFSZ
 MCHuuXpc0c6br1iiYH5SwN8zsJ3HQ2g=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-Z6x4b81tN9qNaLSUzyt3dQ-1; Mon, 18 Jul 2022 03:22:07 -0400
X-MC-Unique: Z6x4b81tN9qNaLSUzyt3dQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 f8-20020a05622a1a0800b0031ec4d66fc9so8008241qtb.21
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 00:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fXKs0Su32/6Nm8nN5u8HEw5FRDFan4AlrF2o703Uj1I=;
 b=hVY0F5sysMAwq+VFGT3qkiN1IFgdLy50+PMLAbrddcLrlgON/QJ6NMcZAE3QrDis8z
 EP2yW2fP/1yEDqYbTyiwyxO3aplYpqYxNyooo2NQVKcKOO22EPbeKv5huGGJD4ZiYuG3
 uAHmUiKYSVkNpuC/LIJGF6Ta/S+7TGKFEDirm+fsLFOJl2tSRfoi2B0bOFBB5hxpBupX
 xFCmQ39tV9/pmf3kJ9CQId03A0y6+zCgucyySWAl+L4eN7A2YR3+qdgXoSVF0Cvp0488
 ZYjbKDaWkxGDM1pdz+GkGG53xlEpIe8UTmwrUnFBbHM3lo8z6GYbYpAtFCAy/AqbkXh2
 q8hw==
X-Gm-Message-State: AJIora8Bvt8HrgM8OhImiy+wxG0WTTLkW+eCyAdYsnc8vc1858q2oCXW
 bLkr2E48CC7jmARFEuQnmpsHfaI2i1+ob/6Ah5jNmEyIxBPxkeXfWj457UIEXcxmmgSQkG0OUlG
 crU2gsRUmoyyPNU/fQAZjCjtnlELXJ1o=
X-Received: by 2002:a05:620a:f10:b0:6aa:318e:55a9 with SMTP id
 v16-20020a05620a0f1000b006aa318e55a9mr16482694qkl.559.1658128927423; 
 Mon, 18 Jul 2022 00:22:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sShOJEFdlJ7gU+4H0Lg3FVgp2hP/bPC4VfaCzMbZqU9Gh7xUyev3DOtYECQjOB3YS/EDdz9BSDMm1xJ2j+ZFQ=
X-Received: by 2002:a05:620a:f10:b0:6aa:318e:55a9 with SMTP id
 v16-20020a05620a0f1000b006aa318e55a9mr16482677qkl.559.1658128927202; Mon, 18
 Jul 2022 00:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220716113407.2730331-1-eperezma@redhat.com>
 <20220716113407.2730331-4-eperezma@redhat.com>
 <CACGkMEskdYYcJMXDgAmmAoO2QnE2DieaRj70_SLAYY0ygZvSgA@mail.gmail.com>
In-Reply-To: <CACGkMEskdYYcJMXDgAmmAoO2QnE2DieaRj70_SLAYY0ygZvSgA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 18 Jul 2022 09:21:31 +0200
Message-ID: <CAJaqyWeB6iNx7newH5CjdpFZh_AUz1WL_2xLfs3-J6Oy7RLeyQ@mail.gmail.com>
Subject: Re: [RFC PATCH 03/12] vdpa: Small rename of error labels
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eli Cohen <eli@mellanox.com>, 
 Parav Pandit <parav@mellanox.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Gautam Dawar <gdawar@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, Jul 18, 2022 at 7:50 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Sat, Jul 16, 2022 at 7:34 PM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > So later patches are cleaner
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/virtio/vhost-vdpa.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 4458c8d23e..906c365036 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -1039,7 +1039,7 @@ static bool vhost_vdpa_svqs_start(struct vhost_de=
v *dev)
> >          int r;
> >          bool ok =3D vhost_vdpa_svq_setup(dev, svq, i, &err);
> >          if (unlikely(!ok)) {
> > -            goto err;
> > +            goto err_svq_setup;
> >          }
> >
> >          vhost_svq_start(svq, dev->vdev, vq);
> > @@ -1064,8 +1064,7 @@ err_set_addr:
> >  err_map:
> >      vhost_svq_stop(g_ptr_array_index(v->shadow_vqs, i));
> >
> > -err:
> > -    error_reportf_err(err, "Cannot setup SVQ %u: ", i);
>
> This does not look like a simple rename.
>

That's right.

I'll drop his patch from the series, it's not really useful and only adds n=
oise.

Thanks!

> Thanks
>
> > +err_svq_setup:
> >      for (unsigned j =3D 0; j < i; ++j) {
> >          VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs,=
 j);
> >          vhost_vdpa_svq_unmap_rings(dev, svq);
> > --
> > 2.31.1
> >
>


