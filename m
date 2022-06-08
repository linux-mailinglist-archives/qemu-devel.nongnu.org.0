Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDAE543D05
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 21:41:18 +0200 (CEST)
Received: from localhost ([::1]:37294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz1YK-0002MA-1L
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 15:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nz1Wj-0001ap-3x
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 15:39:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nz1Wg-0000Gp-Lf
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 15:39:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654717173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JrZezDLTPm6B8RFtAtbbXWE+RJEJkGCfuLtTxaR201E=;
 b=OcOuyhDKwhoqMjqw4muX3t0l73R5F7TiqsmBeLEMJAFpEXPM7yAeAp/joiJwlsmhoA7W0q
 ILOyLGmsrdfTW5fAyJq8XDQAiusH5D30lOVAhdSiK+Y/exSeQElvxH/zuCRvx9OA8hSY++
 ztq1uj56LQxZrFtNaQ4Vu89VlByaawA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-wzUXFKOINT6WWe81Ddx_cQ-1; Wed, 08 Jun 2022 15:39:32 -0400
X-MC-Unique: wzUXFKOINT6WWe81Ddx_cQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 x18-20020a0ce0d2000000b0046458e0e18bso13598204qvk.1
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 12:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JrZezDLTPm6B8RFtAtbbXWE+RJEJkGCfuLtTxaR201E=;
 b=pQwPVfBl/FHJvhPv+FqZcWZ4mTKHw+p1U6A0ZX9y7Uzw7w5828ptE9iwwQDuXfAvjU
 K0uKMpcBWD9KklTndDQ62sQug1vXwtLuz2s2UWEfKt+Ox04E/OmEZKaBYZ3OM9IFSA8c
 jEWQ3k2XVOvw3Mne53of4t8TxlPEJBZ5GAXMqcaRwZZ9ix3rYCcpu9XrTS9JtV61dbAn
 iyMoFoShf3bMvRgoZd7cBr92qpd8HMb+lHLEaTwmmQ3jH6WvEmRZxUi+zUZp1XSWENnC
 qS/Ert1QxTfPtWoI3HHUcjV8Cl9HRr1r/UkNzFZYPiRcWsA58z/R4TbkKEDZx/Z4ZCqs
 rL0Q==
X-Gm-Message-State: AOAM530Tk9JoOuUuMRCxRxHkkpi0q8OB12OJeOO7t1hNimkUaGzg3DWm
 yIekS/MqLPxBERlr3YPWb4qqJjczWDmSCSBFl4RzvYPZsAP18G0G6v1qGx7+ONzI6rPBJLoK/0S
 2abGwVtoGkqLtLRho7d3SqRjZAdKGFJo=
X-Received: by 2002:a05:622a:14c6:b0:2f4:730e:40fa with SMTP id
 u6-20020a05622a14c600b002f4730e40famr28733057qtx.495.1654717172063; 
 Wed, 08 Jun 2022 12:39:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKYkrXhmILT/ipzNyY4Mtl7Bm1F+kvMbw4gmrZiHsbPGJ7qcLfOh1rDZA6COc+Nf9LIx3JftAPJVyVpZEexgQ=
X-Received: by 2002:a05:622a:14c6:b0:2f4:730e:40fa with SMTP id
 u6-20020a05622a14c600b002f4730e40famr28733020qtx.495.1654717171615; Wed, 08
 Jun 2022 12:39:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220519191306.821774-1-eperezma@redhat.com>
 <20220519191306.821774-3-eperezma@redhat.com>
 <73865506-4df0-f9ed-d30c-718d352f700c@redhat.com>
In-Reply-To: <73865506-4df0-f9ed-d30c-718d352f700c@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 8 Jun 2022 21:38:55 +0200
Message-ID: <CAJaqyWeBhwEaVKe8YpXGnuxocrVBXJqKw6OFrR5cC22vJxif0w@mail.gmail.com>
Subject: Re: [RFC PATCH v8 02/21] vhost: Add custom used buffer callback
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Eric Blake <eblake@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Parav Pandit <parav@mellanox.com>
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

On Tue, Jun 7, 2022 at 8:12 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/5/20 03:12, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > The callback allows SVQ users to know the VirtQueue requests and
> > responses. QEMU can use this to synchronize virtio device model state,
> > allowing to migrate it with minimum changes to the migration code.
> >
> > In the case of networking, this will be used to inspect control
> > virtqueue messages.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.h | 16 +++++++++++++++-
> >   include/hw/virtio/vhost-vdpa.h     |  2 ++
> >   hw/virtio/vhost-shadow-virtqueue.c |  9 ++++++++-
> >   hw/virtio/vhost-vdpa.c             |  3 ++-
> >   4 files changed, 27 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index c132c994e9..6593f07db3 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -15,6 +15,13 @@
> >   #include "standard-headers/linux/vhost_types.h"
> >   #include "hw/virtio/vhost-iova-tree.h"
> >
> > +typedef void (*VirtQueueElementCallback)(VirtIODevice *vdev,
> > +                                         const VirtQueueElement *elem)=
;
>
>
> Nit: I wonder if something like "VirtQueueCallback" is sufficient (e.g
> kernel use "callback" directly)
>

I didn't think about the notification part of the "callback" but more
on the function callback, to notify the net or vhost-vdpa net
subsystem :). But I think it can be named your way for sure.

If we ever have other callbacks closer to vq than to vq elements to
rename it later shouldn't be a big deal.

>
> > +
> > +typedef struct VhostShadowVirtqueueOps {
> > +    VirtQueueElementCallback used_elem_handler;
> > +} VhostShadowVirtqueueOps;
> > +
> >   /* Shadow virtqueue to relay notifications */
> >   typedef struct VhostShadowVirtqueue {
> >       /* Shadow vring */
> > @@ -59,6 +66,12 @@ typedef struct VhostShadowVirtqueue {
> >        */
> >       uint16_t *desc_next;
> >
> > +    /* Optional callbacks */
> > +    const VhostShadowVirtqueueOps *ops;
>
>
> Can we merge map_ops to ops?
>

It can be merged, but they are set by different actors.

map_ops is received by hw/virtio/vhost-vdpa, while this ops depends on
the kind of device. Is it ok to fill the ops members "by chunks"?

>
> > +
> > +    /* Optional custom used virtqueue element handler */
> > +    VirtQueueElementCallback used_elem_cb;
>
>
> This seems not used in this series.
>

Right, this is a leftover. Thanks for pointing it out!

Thanks!

> Thanks
>
>
> > +
> >       /* Next head to expose to the device */
> >       uint16_t shadow_avail_idx;
> >
> > @@ -85,7 +98,8 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtI=
ODevice *vdev,
> >                        VirtQueue *vq);
> >   void vhost_svq_stop(VhostShadowVirtqueue *svq);
> >
> > -VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree);
> > +VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
> > +                                    const VhostShadowVirtqueueOps *ops=
);
> >
> >   void vhost_svq_free(gpointer vq);
> >   G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostShadowVirtqueue, vhost_svq_free);
> > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-v=
dpa.h
> > index a29dbb3f53..f1ba46a860 100644
> > --- a/include/hw/virtio/vhost-vdpa.h
> > +++ b/include/hw/virtio/vhost-vdpa.h
> > @@ -17,6 +17,7 @@
> >   #include "hw/virtio/vhost-iova-tree.h"
> >   #include "hw/virtio/virtio.h"
> >   #include "standard-headers/linux/vhost_types.h"
> > +#include "hw/virtio/vhost-shadow-virtqueue.h"
> >
> >   typedef struct VhostVDPAHostNotifier {
> >       MemoryRegion mr;
> > @@ -35,6 +36,7 @@ typedef struct vhost_vdpa {
> >       /* IOVA mapping used by the Shadow Virtqueue */
> >       VhostIOVATree *iova_tree;
> >       GPtrArray *shadow_vqs;
> > +    const VhostShadowVirtqueueOps *shadow_vq_ops;
> >       struct vhost_dev *dev;
> >       VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> >   } VhostVDPA;
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 56c96ebd13..167db8be45 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -410,6 +410,10 @@ static void vhost_svq_flush(VhostShadowVirtqueue *=
svq,
> >                   break;
> >               }
> >
> > +            if (svq->ops && svq->ops->used_elem_handler) {
> > +                svq->ops->used_elem_handler(svq->vdev, elem);
> > +            }
> > +
> >               if (unlikely(i >=3D svq->vring.num)) {
> >                   qemu_log_mask(LOG_GUEST_ERROR,
> >                            "More than %u used buffers obtained in a %u =
size SVQ",
> > @@ -607,12 +611,14 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
> >    * shadow methods and file descriptors.
> >    *
> >    * @iova_tree: Tree to perform descriptors translations
> > + * @ops: SVQ operations hooks
> >    *
> >    * Returns the new virtqueue or NULL.
> >    *
> >    * In case of error, reason is reported through error_report.
> >    */
> > -VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree)
> > +VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
> > +                                    const VhostShadowVirtqueueOps *ops=
)
> >   {
> >       g_autofree VhostShadowVirtqueue *svq =3D g_new0(VhostShadowVirtqu=
eue, 1);
> >       int r;
> > @@ -634,6 +640,7 @@ VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *=
iova_tree)
> >       event_notifier_init_fd(&svq->svq_kick, VHOST_FILE_UNBIND);
> >       event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call=
);
> >       svq->iova_tree =3D iova_tree;
> > +    svq->ops =3D ops;
> >       return g_steal_pointer(&svq);
> >
> >   err_init_hdev_call:
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 66f054a12c..7677b337e6 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -418,7 +418,8 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hd=
ev, struct vhost_vdpa *v,
> >
> >       shadow_vqs =3D g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
> >       for (unsigned n =3D 0; n < hdev->nvqs; ++n) {
> > -        g_autoptr(VhostShadowVirtqueue) svq =3D vhost_svq_new(v->iova_=
tree);
> > +        g_autoptr(VhostShadowVirtqueue) svq =3D vhost_svq_new(v->iova_=
tree,
> > +                                                            v->shadow_=
vq_ops);
> >
> >           if (unlikely(!svq)) {
> >               error_setg(errp, "Cannot create svq %u", n);
>


