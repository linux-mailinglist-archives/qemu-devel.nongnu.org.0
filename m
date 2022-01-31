Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D74F4A4C6F
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 17:49:27 +0100 (CET)
Received: from localhost ([::1]:43134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEZrq-0005GN-4C
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 11:49:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nEZfw-0001Lr-LT
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 11:37:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nEZfq-0002LB-KQ
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 11:37:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643647021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i4NFuUGEOt6ZMUpyh9ahSqcFwwTjx1XFLnPuhZvg/pc=;
 b=hf3WAUWVO1ibVlAG6fwrES0vPOpdFoY9bGWsrHaw3ofdryXXGKmZfXLUcIkytw6l8Adz8q
 JaDPsBWO2WekiQgmuSeSMxHSHJvfb40dmsvLvEU3MiNNeUC0THEkaXRvXVgidaAKOSvKo2
 wOBYOBM/IYPROTXQuVnlDWR3U17l4nU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-oCONUcE1NIqBX3r-n5LjIA-1; Mon, 31 Jan 2022 11:37:00 -0500
X-MC-Unique: oCONUcE1NIqBX3r-n5LjIA-1
Received: by mail-qt1-f197.google.com with SMTP id
 4-20020ac85744000000b002b2f329efc2so10697384qtx.12
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 08:37:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=i4NFuUGEOt6ZMUpyh9ahSqcFwwTjx1XFLnPuhZvg/pc=;
 b=FnxZEdg7r+Rtmadx4hnLZlp3P0yGbm/Eo3xnb1U+dvjN9KtZ2Oj8EDNH++Jk3HpAGd
 lDq/rwNWrXKEq+Pql1WWo92va4WrQjW9XewReL5dsZAEztKo6LGMx784OTKy5uwI1maJ
 1Gu539BYrGDk5rKn8qZ9LrPeJT6xxdQ8QZ7q/TyoyPPVDeYIHhAu57iyctKFF5sQ7/qg
 3gHZ+RktDyAWmDxNTheEz7FJ32t++Pr/XtKJ7GLBhvScjLBfYvxXBXZje9FZCkXpgP9i
 R/Rhf/t33+Rwlp78qLvguvlJjLm52bvhBdtBMkvjjZQqMvZksj4FY5JeVTlLvA7zbLt0
 UbuQ==
X-Gm-Message-State: AOAM531FdvkkTIBua2W89ODsEWn/LvGhMbWsAbM0kDg9ysIkS1cxAe/T
 kxFo/LqilW7XrOb2z2uT8Xb5jbXK5CKkQMyTHxWPkJTsp06SO2IAIXAdQGSofvCCwl572dHuW7P
 wQVlh7iGD2ofk4JUaVb2vOUC0GL5g5/E=
X-Received: by 2002:ad4:5f8d:: with SMTP id jp13mr18083635qvb.70.1643647019701; 
 Mon, 31 Jan 2022 08:36:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKDl0SFTcMQST/rN99Zj8Tzgw1+d4siR4YiB1hG2YL45iLjs8zNBQJVcLeCiPDu2t5T5mbslfONkViYcqss8M=
X-Received: by 2002:ad4:5f8d:: with SMTP id jp13mr18083593qvb.70.1643647019399; 
 Mon, 31 Jan 2022 08:36:59 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-16-eperezma@redhat.com>
 <04720687-f6b9-1ed9-c4da-30a965743065@redhat.com>
In-Reply-To: <04720687-f6b9-1ed9-c4da-30a965743065@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 31 Jan 2022 17:36:23 +0100
Message-ID: <CAJaqyWeNwKpj3PS1r1T3g-TZivVni9jBsnh-h5eMk5bUxDQ6Tw@mail.gmail.com>
Subject: Re: [PATCH 15/31] vdpa: Add vhost_svq_get_num
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jan 29, 2022 at 9:15 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > This reports the guest's visible SVQ effective length, not the device's
> > one.
>
>
> I think we need to explain if there could be a case that the SVQ size is
> not equal to the device queue size.
>

The description is actually misleading now that I re-read it. It
reports the size that the guest negotiated with SVQ for the guest's
vring, not the one that SVQ negotiates with the device for SVQ's
vring. I'll reword for the next version so thanks for pointing it out.

Regarding your comment, the only case it can happen is if SVQ cannot
get device's num, something that we could make an error as you point
out later in the series.

Thanks!

> Thanks
>
>
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.h | 1 +
> >   hw/virtio/vhost-shadow-virtqueue.c | 5 +++++
> >   2 files changed, 6 insertions(+)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index 3521e8094d..035207a469 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -29,6 +29,7 @@ const EventNotifier *vhost_svq_get_svq_call_notifier(
> >                                                 const VhostShadowVirtqu=
eue *svq);
> >   void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
> >                                 struct vhost_vring_addr *addr);
> > +uint16_t vhost_svq_get_num(const VhostShadowVirtqueue *svq);
> >   size_t vhost_svq_driver_area_size(const VhostShadowVirtqueue *svq);
> >   size_t vhost_svq_device_area_size(const VhostShadowVirtqueue *svq);
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 0f2c2403ff..f129ec8395 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -212,6 +212,11 @@ void vhost_svq_get_vring_addr(const VhostShadowVir=
tqueue *svq,
> >       addr->used_user_addr =3D (uint64_t)svq->vring.used;
> >   }
> >
> > +uint16_t vhost_svq_get_num(const VhostShadowVirtqueue *svq)
> > +{
> > +    return svq->vring.num;
> > +}
> > +
> >   size_t vhost_svq_driver_area_size(const VhostShadowVirtqueue *svq)
> >   {
> >       size_t desc_size =3D sizeof(vring_desc_t) * svq->vring.num;
>


