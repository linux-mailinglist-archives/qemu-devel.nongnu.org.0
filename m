Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 966EF4429D7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 09:49:54 +0100 (CET)
Received: from localhost ([::1]:55616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhpUP-0001h6-Og
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 04:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhpRq-0007GX-6k
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:47:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhpRo-00088H-5i
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:47:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635842830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yQ4zVo431jJvV3OQX2WmnR3BoE9d7qdzPg8WNVwADYs=;
 b=GvT+AzZ6586vusLo+xeHDBKNG/kdmmCdRtw8RrEIsCh42gy/UcZLHbyCPPlFS6Ne0CsQRb
 w5PJkduQvrKzBgzUVTJ4kwrdA33+BZxGoZmqn6hE9WB5/85N/FCcBx2e4b2vmWW/RMxDGA
 MPFWO7sX/OS2RoSapIinruvHdfxmSco=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-q96YIjqeN7e7o0rOodjerw-1; Tue, 02 Nov 2021 04:47:08 -0400
X-MC-Unique: q96YIjqeN7e7o0rOodjerw-1
Received: by mail-qt1-f197.google.com with SMTP id
 c14-20020ac87d8e000000b002ac69908b09so7281979qtd.9
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 01:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yQ4zVo431jJvV3OQX2WmnR3BoE9d7qdzPg8WNVwADYs=;
 b=UgKCaKCNPtmZlPfbIrFtAtvTqkj+UbwmCScn+GKjtAHKVSq+dDhcMJlwMHRheh+X5V
 Cu1fxv6ZR3JPtjKZMYmdKZ/3H0ABNI2w5OzqO/ep6iYNgFKvaxROTcXX5t2n0t3jsRho
 0xiAHE+b9IYwoKAFviAJCxJXdBN3pAgyTexwpzJeqxQV5P+44ie7yCTXvWtyi5yeCbng
 XlrHAbUm6DAhztMAC7d3d4CN/f8CqARdfAuZwKUfT7jXNWtTE9gYgmbb1u5WDl7Sg+yA
 g7kp1D0ZBhV3mHQIWU9yZMqLgvx7N32Zi8geh/0v1ap5rDzCuD68n1fcWoZK4Yd28Ydm
 fYsg==
X-Gm-Message-State: AOAM532rAc2UGn5KoN9pBCD+z65ghRWw1jUB4eWuA/TeoZZbMqj3/kPH
 lRf15ZwWuQIrYsLCj6hSzyRxRNdBlu/XDqqpUqWWGrKeUUa2oygs3pjer0pKaTpZeJO6Syli+RC
 jBXW25sakiy9vnMYYNw7NQbCCpnIhAiY=
X-Received: by 2002:a37:9acd:: with SMTP id c196mr2736916qke.495.1635842828135; 
 Tue, 02 Nov 2021 01:47:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiElldvIrN5ms0DY4SEFwE+H/xrXavhnxlRxprW0+FvZjJw8jTEKFHabAfAzcINaKC0LB/4LucI5iDKGsD/5g=
X-Received: by 2002:a37:9acd:: with SMTP id c196mr2736875qke.495.1635842827891; 
 Tue, 02 Nov 2021 01:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211029183525.1776416-1-eperezma@redhat.com>
 <20211029183525.1776416-12-eperezma@redhat.com>
 <74dbf70f-96a7-6fe3-dbc5-28a7b7989109@redhat.com>
In-Reply-To: <74dbf70f-96a7-6fe3-dbc5-28a7b7989109@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 2 Nov 2021 09:46:31 +0100
Message-ID: <CAJaqyWe56+wzXgdQp4nbGxhrSU4tPU+SkgTBUa=wSB5nSbtwuw@mail.gmail.com>
Subject: Re: [RFC PATCH v5 11/26] vhost: Handle host notifiers in SVQ
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Xiao W Wang <xiao.w.wang@intel.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Parav Pandit <parav@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 2, 2021 at 8:55 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/10/30 =E4=B8=8A=E5=8D=882:35, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > If device supports host notifiers, this makes one jump less (kernel) to
> > deliver SVQ notifications to it.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.h |  2 ++
> >   hw/virtio/vhost-shadow-virtqueue.c | 23 ++++++++++++++++++++++-
> >   2 files changed, 24 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index 30ab9643b9..eb0a54f954 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -18,6 +18,8 @@ typedef struct VhostShadowVirtqueue VhostShadowVirtqu=
eue;
> >   void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kic=
k_fd);
> >   const EventNotifier *vhost_svq_get_dev_kick_notifier(
> >                                                 const VhostShadowVirtqu=
eue *svq);
> > +void vhost_svq_set_host_mr_notifier(VhostShadowVirtqueue *svq, void *a=
ddr);
> > +
> >   void vhost_svq_start(struct vhost_dev *dev, unsigned idx,
> >                        VhostShadowVirtqueue *svq, int svq_kick_fd);
> >   void vhost_svq_stop(struct vhost_dev *dev, unsigned idx,
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index fda60d11db..e3dcc039b6 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -29,6 +29,12 @@ typedef struct VhostShadowVirtqueue {
> >        * So shadow virtqueue must not clean it, or we would lose VirtQu=
eue one.
> >        */
> >       EventNotifier svq_kick;
> > +
> > +    /* Device's host notifier memory region. NULL means no region */
> > +    void *host_notifier_mr;
> > +
> > +    /* Virtio queue shadowing */
> > +    VirtQueue *vq;
> >   } VhostShadowVirtqueue;
> >
> >   /**
> > @@ -50,7 +56,20 @@ static void vhost_handle_guest_kick(EventNotifier *n=
)
> >           return;
> >       }
> >
> > -    event_notifier_set(&svq->hdev_kick);
> > +    if (svq->host_notifier_mr) {
> > +        uint16_t *mr =3D svq->host_notifier_mr;
> > +        *mr =3D virtio_get_queue_index(svq->vq);
>
>
> Do we need barriers around the possible MMIO here?

That's right, I missed them.

>
> To avoid those complicated stuff, I'd rather simply go with eventfd path.
>
> Note mmio and eventfd are not mutually exclusive.

Actually we cannot ignore them since they are set in the guest. If SVQ
does nothing about them, the guest's notification will travel directly
to the vdpa device, and SVQ cannot intercept them.

Taking that into account, it's actually less changes to move them to
SVQ (like in this series) than to disable them (like in previous
series). But we can go with disabling them for sure.

Thanks!

>
> Thanks
>
>
> > +    } else {
> > +        event_notifier_set(&svq->hdev_kick);
> > +    }
> > +}
> > +
> > +/*
> > + * Set the device's memory region notifier. addr =3D NULL clear it.
> > + */
> > +void vhost_svq_set_host_mr_notifier(VhostShadowVirtqueue *svq, void *a=
ddr)
> > +{
> > +    svq->host_notifier_mr =3D addr;
> >   }
> >
> >   /**
> > @@ -134,6 +153,7 @@ void vhost_svq_stop(struct vhost_dev *dev, unsigned=
 idx,
> >    */
> >   VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx)
> >   {
> > +    int vq_idx =3D dev->vq_index + idx;
> >       g_autofree VhostShadowVirtqueue *svq =3D g_new0(VhostShadowVirtqu=
eue, 1);
> >       int r;
> >
> > @@ -151,6 +171,7 @@ VhostShadowVirtqueue *vhost_svq_new(struct vhost_de=
v *dev, int idx)
> >           goto err_init_hdev_call;
> >       }
> >
> > +    svq->vq =3D virtio_get_queue(dev->vdev, vq_idx);
> >       return g_steal_pointer(&svq);
> >
> >   err_init_hdev_call:
>


