Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A4C33D8DE
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 17:15:18 +0100 (CET)
Received: from localhost ([::1]:35436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMCLl-0004qV-Rh
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 12:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lMCCz-0004vT-Ma
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:06:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lMCCv-00036w-3i
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:06:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615910768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=43uFhPbB1e4bmajgbraokFHCvAChATlvMtxK6K2G7hk=;
 b=WQJDwgVT44X26cHmnIsfGw214MfIDLCLkqyH1EuQiMT7a5DiADMEk56qmYwyMqjSJGfwmN
 qWbMf6+umLw8+ChZFysS+txkdyCAnYYidADsZBmjLHs8xu5jSL9PG75ZOQ+RFxo3jXBUYx
 HeB6yrOft9+muYZGT6HSpiFLNRZlIRc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-43MGYJiIPcCCWuXGBY-EHQ-1; Tue, 16 Mar 2021 12:06:06 -0400
X-MC-Unique: 43MGYJiIPcCCWuXGBY-EHQ-1
Received: by mail-qv1-f71.google.com with SMTP id i1so25660647qvu.12
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 09:06:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=43uFhPbB1e4bmajgbraokFHCvAChATlvMtxK6K2G7hk=;
 b=oyRnn3Pm2rYHRvbrVHSpxPplsCsDEMUcqiujo153UEddXS1axYiN/etqFSkTGES8W5
 T7OXvm6GC3G9/F+idcr/vek52ZNC78bTCHdCyqmGJXVoFPmFtLBTPUyd0mv+rBaOb1rY
 XOO6nwUQmVaDkfwXTLVRCSIEawEafpjbFcAijTbaq78PeYOQZ7JX1DWlplq7cuRnEWtj
 Oznc5IyxTLn79b1re4a+/A1/NhWfi+DghkFa51O0a4ppnWwX847wgTQJn7WDFXfJFiKU
 QI7Nlcdx0r5s9ZWJ4zqQByDSR/T/EpA8r5hFZ08Vj0MyKkmeQwyU0Dw7IuuEB26IvOJl
 pqKA==
X-Gm-Message-State: AOAM531+TvH9YE3L0lvVvOsAxKq9K72bwckONUrt4usMz/PGmMpi1DLc
 ojLQXgkD/VlgsQD05OKT0HD8g0w+4dLpAuN3tf6V9l654iWA9VGzY+vrbDvSBBEujmVp5UJbiXM
 4rR2RrZNMP9kaGCtGOCla1Emypxj5gmg=
X-Received: by 2002:a05:620a:29c5:: with SMTP id
 s5mr270474qkp.233.1615910765638; 
 Tue, 16 Mar 2021 09:06:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDzlNygRwfF3g2rUMWyo405ugWnZQgI547C3oVhzACJA4iJo4dEQjE+Ro05qAKnbUIF28wUK975ZPNgx+ecfs=
X-Received: by 2002:a05:620a:29c5:: with SMTP id
 s5mr270424qkp.233.1615910765158; 
 Tue, 16 Mar 2021 09:06:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210315194842.277740-1-eperezma@redhat.com>
 <20210315194842.277740-12-eperezma@redhat.com>
 <5fcc5f81-88f7-1c00-c4a6-6ba5ad21ac8b@redhat.com>
In-Reply-To: <5fcc5f81-88f7-1c00-c4a6-6ba5ad21ac8b@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 16 Mar 2021 17:05:29 +0100
Message-ID: <CAJaqyWftTU3R7mpZVU8PPmTYEg8aYki4AgMafFB6vkOJAv5NFw@mail.gmail.com>
Subject: Re: [RFC v2 11/13] vhost: Shadow virtqueue buffers forwarding
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Guru Prasad <guru.prasad@broadcom.com>, Juan Quintela <quintela@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 16, 2021 at 9:15 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/3/16 =E4=B8=8A=E5=8D=883:48, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > Initial version of shadow virtqueue that actually forward buffers.
> >
> > It reuses the VirtQueue code for the device part. The driver part is
> > based on Linux's virtio_ring driver, but with stripped functionality
> > and optimizations so it's easier to review.
> >
> > These will be added in later commits.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.c | 212 +++++++++++++++++++++++++++-=
-
> >   hw/virtio/vhost.c                  | 113 ++++++++++++++-
> >   2 files changed, 312 insertions(+), 13 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 1460d1d5d1..68ed0f2740 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -9,6 +9,7 @@
> >
> >   #include "hw/virtio/vhost-shadow-virtqueue.h"
> >   #include "hw/virtio/vhost.h"
> > +#include "hw/virtio/virtio-access.h"
> >
> >   #include "standard-headers/linux/vhost_types.h"
> >
> > @@ -55,11 +56,96 @@ typedef struct VhostShadowVirtqueue {
> >       /* Virtio device */
> >       VirtIODevice *vdev;
> >
> > +    /* Map for returning guest's descriptors */
> > +    VirtQueueElement **ring_id_maps;
> > +
> > +    /* Next head to expose to device */
> > +    uint16_t avail_idx_shadow;
> > +
> > +    /* Next free descriptor */
> > +    uint16_t free_head;
> > +
> > +    /* Last seen used idx */
> > +    uint16_t shadow_used_idx;
> > +
> > +    /* Next head to consume from device */
> > +    uint16_t used_idx;
> > +
> >       /* Descriptors copied from guest */
> >       vring_desc_t descs[];
> >   } VhostShadowVirtqueue;
> >
> > -/* Forward guest notifications */
> > +static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
> > +                                    const struct iovec *iovec,
> > +                                    size_t num, bool more_descs, bool =
write)
> > +{
> > +    uint16_t i =3D svq->free_head, last =3D svq->free_head;
> > +    unsigned n;
> > +    uint16_t flags =3D write ? virtio_tswap16(svq->vdev, VRING_DESC_F_=
WRITE) : 0;
> > +    vring_desc_t *descs =3D svq->vring.desc;
> > +
> > +    if (num =3D=3D 0) {
> > +        return;
> > +    }
> > +
> > +    for (n =3D 0; n < num; n++) {
> > +        if (more_descs || (n + 1 < num)) {
> > +            descs[i].flags =3D flags | virtio_tswap16(svq->vdev,
> > +                                                    VRING_DESC_F_NEXT)=
;
> > +        } else {
> > +            descs[i].flags =3D flags;
> > +        }
> > +        descs[i].addr =3D virtio_tswap64(svq->vdev, (hwaddr)iovec[n].i=
ov_base);
>
>
> So unsing virtio_tswap() is probably not correct since we're talking
> with vhost backends which has its own endiness.
>

I was trying to expose the buffer with the same endianness as the
driver originally offered, so if guest->qemu requires a bswap, I think
it will always require a bswap again to expose to the device again.

> For vhost-vDPA, we can assume that it's a 1.0 device.

Isn't it needed if the host is big endian?

>
>
> > +        descs[i].len =3D virtio_tswap32(svq->vdev, iovec[n].iov_len);
> > +
> > +        last =3D i;
> > +        i =3D virtio_tswap16(svq->vdev, descs[i].next);
> > +    }
> > +
> > +    svq->free_head =3D virtio_tswap16(svq->vdev, descs[last].next);
> > +}
> > +
> > +static unsigned vhost_shadow_vq_add_split(VhostShadowVirtqueue *svq,
> > +                                          VirtQueueElement *elem)
> > +{
> > +    int head;
> > +    unsigned avail_idx;
> > +    vring_avail_t *avail =3D svq->vring.avail;
> > +
> > +    head =3D svq->free_head;
> > +
> > +    /* We need some descriptors here */
> > +    assert(elem->out_num || elem->in_num);
> > +
> > +    vhost_vring_write_descs(svq, elem->out_sg, elem->out_num,
> > +                            elem->in_num > 0, false);
> > +    vhost_vring_write_descs(svq, elem->in_sg, elem->in_num, false, tru=
e);
> > +
> > +    /*
> > +     * Put entry in available array (but don't update avail->idx until=
 they
> > +     * do sync).
> > +     */
> > +    avail_idx =3D svq->avail_idx_shadow & (svq->vring.num - 1);
> > +    avail->ring[avail_idx] =3D virtio_tswap16(svq->vdev, head);
> > +    svq->avail_idx_shadow++;
> > +
> > +    /* Expose descriptors to device */
> > +    smp_wmb();
> > +    avail->idx =3D virtio_tswap16(svq->vdev, svq->avail_idx_shadow);
> > +
> > +    return head;
> > +
> > +}
> > +
> > +static void vhost_shadow_vq_add(VhostShadowVirtqueue *svq,
> > +                                VirtQueueElement *elem)
> > +{
> > +    unsigned qemu_head =3D vhost_shadow_vq_add_split(svq, elem);
> > +
> > +    svq->ring_id_maps[qemu_head] =3D elem;
> > +}
> > +
> > +/* Handle guest->device notifications */
> >   static void vhost_handle_guest_kick(EventNotifier *n)
> >   {
> >       VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowVirtqueu=
e,
> > @@ -69,7 +155,72 @@ static void vhost_handle_guest_kick(EventNotifier *=
n)
> >           return;
> >       }
> >
> > -    event_notifier_set(&svq->kick_notifier);
> > +    /* Make available as many buffers as possible */
> > +    do {
> > +        if (virtio_queue_get_notification(svq->vq)) {
> > +            /* No more notifications until process all available */
> > +            virtio_queue_set_notification(svq->vq, false);
> > +        }
> > +
> > +        while (true) {
> > +            VirtQueueElement *elem;
> > +            if (virtio_queue_full(svq->vq)) {
> > +                break;
>
>
> So we've disabled guest notification. If buffer has been consumed, we
> need to retry the handle_guest_kick here. But I didn't find the code?
>

This code follows the pattern of virtio_blk_handle_vq: we jump out of
the inner while, and we re-enable the notifications. After that, we
check for updates on guest avail_idx.

>
> > +            }
> > +
> > +            elem =3D virtqueue_pop(svq->vq, sizeof(*elem));
> > +            if (!elem) {
> > +                break;
> > +            }
> > +
> > +            vhost_shadow_vq_add(svq, elem);
> > +            event_notifier_set(&svq->kick_notifier);
> > +        }
> > +
> > +        virtio_queue_set_notification(svq->vq, true);
> > +    } while (!virtio_queue_empty(svq->vq));
> > +}
> > +
> > +static bool vhost_shadow_vq_more_used(VhostShadowVirtqueue *svq)
> > +{
> > +    if (svq->used_idx !=3D svq->shadow_used_idx) {
> > +        return true;
> > +    }
> > +
> > +    /* Get used idx must not be reordered */
> > +    smp_rmb();
> > +    svq->shadow_used_idx =3D virtio_tswap16(svq->vdev, svq->vring.used=
->idx);
> > +
> > +    return svq->used_idx !=3D svq->shadow_used_idx;
> > +}
> > +
> > +static VirtQueueElement *vhost_shadow_vq_get_buf(VhostShadowVirtqueue =
*svq)
> > +{
> > +    vring_desc_t *descs =3D svq->vring.desc;
> > +    const vring_used_t *used =3D svq->vring.used;
> > +    vring_used_elem_t used_elem;
> > +    uint16_t last_used;
> > +
> > +    if (!vhost_shadow_vq_more_used(svq)) {
> > +        return NULL;
> > +    }
> > +
> > +    last_used =3D svq->used_idx & (svq->vring.num - 1);
> > +    used_elem.id =3D virtio_tswap32(svq->vdev, used->ring[last_used].i=
d);
> > +    used_elem.len =3D virtio_tswap32(svq->vdev, used->ring[last_used].=
len);
> > +
> > +    if (unlikely(used_elem.id >=3D svq->vring.num)) {
> > +        error_report("Device %s says index %u is available", svq->vdev=
->name,
> > +                     used_elem.id);
> > +        return NULL;
> > +    }
> > +
> > +    descs[used_elem.id].next =3D svq->free_head;
> > +    svq->free_head =3D used_elem.id;
> > +
> > +    svq->used_idx++;
> > +    svq->ring_id_maps[used_elem.id]->len =3D used_elem.len;
> > +    return g_steal_pointer(&svq->ring_id_maps[used_elem.id]);
> >   }
> >
> >   /* Forward vhost notifications */
> > @@ -78,6 +229,7 @@ static void vhost_shadow_vq_handle_call_no_test(Even=
tNotifier *n)
> >       VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowVirtqueu=
e,
> >                                                call_notifier);
> >       EventNotifier *masked_notifier;
> > +    VirtQueue *vq =3D svq->vq;
> >
> >       /* Signal start of using masked notifier */
> >       qemu_event_reset(&svq->masked_notifier.is_free);
> > @@ -86,14 +238,29 @@ static void vhost_shadow_vq_handle_call_no_test(Ev=
entNotifier *n)
> >           qemu_event_set(&svq->masked_notifier.is_free);
> >       }
> >
> > -    if (!masked_notifier) {
> > -        unsigned n =3D virtio_get_queue_index(svq->vq);
> > -        virtio_queue_invalidate_signalled_used(svq->vdev, n);
> > -        virtio_notify_irqfd(svq->vdev, svq->vq);
> > -    } else if (!svq->masked_notifier.signaled) {
> > -        svq->masked_notifier.signaled =3D true;
> > -        event_notifier_set(svq->masked_notifier.n);
> > -    }
> > +    /* Make as many buffers as possible used. */
> > +    do {
> > +        unsigned i =3D 0;
> > +
> > +        /* TODO: Use VRING_AVAIL_F_NO_INTERRUPT */
> > +        while (true) {
> > +            g_autofree VirtQueueElement *elem =3D vhost_shadow_vq_get_=
buf(svq);
> > +            if (!elem) {
> > +                break;
> > +            }
> > +
> > +            assert(i < svq->vring.num);
> > +            virtqueue_fill(vq, elem, elem->len, i++);
> > +        }
> > +
> > +        virtqueue_flush(vq, i);
> > +        if (!masked_notifier) {
> > +            virtio_notify_irqfd(svq->vdev, svq->vq);
> > +        } else if (!svq->masked_notifier.signaled) {
> > +            svq->masked_notifier.signaled =3D true;
> > +            event_notifier_set(svq->masked_notifier.n);
> > +        }
> > +    } while (vhost_shadow_vq_more_used(svq));
> >
> >       if (masked_notifier) {
> >           /* Signal not using it anymore */
> > @@ -103,7 +270,6 @@ static void vhost_shadow_vq_handle_call_no_test(Eve=
ntNotifier *n)
> >
> >   static void vhost_shadow_vq_handle_call(EventNotifier *n)
> >   {
> > -
> >       if (likely(event_notifier_test_and_clear(n))) {
> >           vhost_shadow_vq_handle_call_no_test(n);
> >       }
> > @@ -254,7 +420,11 @@ void vhost_shadow_vq_stop(struct vhost_dev *dev,
> >                             unsigned idx,
> >                             VhostShadowVirtqueue *svq)
> >   {
> > +    int i;
> >       int r =3D vhost_shadow_vq_restore_vdev_host_notifier(dev, idx, sv=
q);
> > +
> > +    assert(!dev->shadow_vqs_enabled);
> > +
> >       if (unlikely(r < 0)) {
> >           error_report("Couldn't restore vq kick fd: %s", strerror(-r))=
;
> >       }
> > @@ -272,6 +442,18 @@ void vhost_shadow_vq_stop(struct vhost_dev *dev,
> >       /* Restore vhost call */
> >       vhost_virtqueue_mask(dev, dev->vdev, dev->vq_index + idx,
> >                            dev->vqs[idx].notifier_is_masked);
> > +
> > +
> > +    for (i =3D 0; i < svq->vring.num; ++i) {
> > +        g_autofree VirtQueueElement *elem =3D svq->ring_id_maps[i];
> > +        /*
> > +         * Although the doc says we must unpop in order, it's ok to un=
pop
> > +         * everything.
> > +         */
> > +        if (elem) {
> > +            virtqueue_unpop(svq->vq, elem, elem->len);
>
>
> Shouldn't we need to wait until all pending requests to be drained? Or
> we may end up duplicated requests?
>

Do you mean pending as in-flight/processing in the device? The device
must be paused at this point. Currently there is no assertion for
this, maybe we can track the device status for it.

For the queue handlers to be running at this point, the main event
loop should serialize QMP and handlers as far as I know (and they
would make all state inconsistent if the device stops suddenly). It
would need to be synchronized if the handlers run in their own AIO
context. That would be nice to have but it's not included here.

> Thanks
>
>
> > +        }
> > +    }
> >   }
> >
> >   /*
> > @@ -284,7 +466,7 @@ VhostShadowVirtqueue *vhost_shadow_vq_new(struct vh=
ost_dev *dev, int idx)
> >       unsigned num =3D virtio_queue_get_num(dev->vdev, vq_idx);
> >       size_t ring_size =3D vring_size(num, VRING_DESC_ALIGN_SIZE);
> >       g_autofree VhostShadowVirtqueue *svq =3D g_malloc0(sizeof(*svq) +=
 ring_size);
> > -    int r;
> > +    int r, i;
> >
> >       r =3D event_notifier_init(&svq->kick_notifier, 0);
> >       if (r !=3D 0) {
> > @@ -303,6 +485,11 @@ VhostShadowVirtqueue *vhost_shadow_vq_new(struct v=
host_dev *dev, int idx)
> >       vring_init(&svq->vring, num, svq->descs, VRING_DESC_ALIGN_SIZE);
> >       svq->vq =3D virtio_get_queue(dev->vdev, vq_idx);
> >       svq->vdev =3D dev->vdev;
> > +    for (i =3D 0; i < num - 1; i++) {
> > +        svq->descs[i].next =3D virtio_tswap16(dev->vdev, i + 1);
> > +    }
> > +
> > +    svq->ring_id_maps =3D g_new0(VirtQueueElement *, num);
> >       event_notifier_set_handler(&svq->call_notifier,
> >                                  vhost_shadow_vq_handle_call);
> >       qemu_event_init(&svq->masked_notifier.is_free, true);
> > @@ -324,5 +511,6 @@ void vhost_shadow_vq_free(VhostShadowVirtqueue *vq)
> >       event_notifier_cleanup(&vq->kick_notifier);
> >       event_notifier_set_handler(&vq->call_notifier, NULL);
> >       event_notifier_cleanup(&vq->call_notifier);
> > +    g_free(vq->ring_id_maps);
> >       g_free(vq);
> >   }
> > diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> > index eab3e334f2..a373999bc4 100644
> > --- a/hw/virtio/vhost.c
> > +++ b/hw/virtio/vhost.c
> > @@ -1021,6 +1021,19 @@ int vhost_device_iotlb_miss(struct vhost_dev *de=
v, uint64_t iova, int write)
> >
> >       trace_vhost_iotlb_miss(dev, 1);
> >
> > +    if (qatomic_load_acquire(&dev->shadow_vqs_enabled)) {
> > +        uaddr =3D iova;
> > +        len =3D 4096;
> > +        ret =3D vhost_backend_update_device_iotlb(dev, iova, uaddr, le=
n,
> > +                                                IOMMU_RW);
> > +        if (ret) {
> > +            trace_vhost_iotlb_miss(dev, 2);
> > +            error_report("Fail to update device iotlb");
> > +        }
> > +
> > +        return ret;
> > +    }
> > +
> >       iotlb =3D address_space_get_iotlb_entry(dev->vdev->dma_as,
> >                                             iova, write,
> >                                             MEMTXATTRS_UNSPECIFIED);
> > @@ -1227,8 +1240,28 @@ static int vhost_sw_live_migration_stop(struct v=
host_dev *dev)
> >       /* Can be read by vhost_virtqueue_mask, from vm exit */
> >       qatomic_store_release(&dev->shadow_vqs_enabled, false);
> >
> > +    dev->vhost_ops->vhost_set_vring_enable(dev, false);
> > +    if (vhost_backend_invalidate_device_iotlb(dev, 0, -1ULL)) {
> > +        error_report("Fail to invalidate device iotlb");
> > +    }
> > +
> >       for (idx =3D 0; idx < dev->nvqs; ++idx) {
> > +        /*
> > +         * Update used ring information for IOTLB to work correctly,
> > +         * vhost-kernel code requires for this.
> > +         */
> > +        struct vhost_virtqueue *vq =3D dev->vqs + idx;
> > +        vhost_device_iotlb_miss(dev, vq->used_phys, true);
> > +
> >           vhost_shadow_vq_stop(dev, idx, dev->shadow_vqs[idx]);
> > +        vhost_virtqueue_start(dev, dev->vdev, &dev->vqs[idx],
> > +                              dev->vq_index + idx);
> > +    }
> > +
> > +    /* Enable guest's vq vring */
> > +    dev->vhost_ops->vhost_set_vring_enable(dev, true);
> > +
> > +    for (idx =3D 0; idx < dev->nvqs; ++idx) {
> >           vhost_shadow_vq_free(dev->shadow_vqs[idx]);
> >       }
> >
> > @@ -1237,6 +1270,59 @@ static int vhost_sw_live_migration_stop(struct v=
host_dev *dev)
> >       return 0;
> >   }
> >
> > +/*
> > + * Start shadow virtqueue in a given queue.
> > + * In failure case, this function leaves queue working as regular vhos=
t mode.
> > + */
> > +static bool vhost_sw_live_migration_start_vq(struct vhost_dev *dev,
> > +                                             unsigned idx)
> > +{
> > +    struct vhost_vring_addr addr =3D {
> > +        .index =3D idx,
> > +    };
> > +    struct vhost_vring_state s =3D {
> > +        .index =3D idx,
> > +    };
> > +    int r;
> > +    bool ok;
> > +
> > +    vhost_virtqueue_stop(dev, dev->vdev, &dev->vqs[idx], dev->vq_index=
 + idx);
> > +    ok =3D vhost_shadow_vq_start(dev, idx, dev->shadow_vqs[idx]);
> > +    if (unlikely(!ok)) {
> > +        return false;
> > +    }
> > +
> > +    /* From this point, vhost_virtqueue_start can reset these changes =
*/
> > +    vhost_shadow_vq_get_vring_addr(dev->shadow_vqs[idx], &addr);
> > +    r =3D dev->vhost_ops->vhost_set_vring_addr(dev, &addr);
> > +    if (unlikely(r !=3D 0)) {
> > +        VHOST_OPS_DEBUG("vhost_set_vring_addr for shadow vq failed");
> > +        goto err;
> > +    }
> > +
> > +    r =3D dev->vhost_ops->vhost_set_vring_base(dev, &s);
> > +    if (unlikely(r !=3D 0)) {
> > +        VHOST_OPS_DEBUG("vhost_set_vring_base for shadow vq failed");
> > +        goto err;
> > +    }
> > +
> > +    /*
> > +     * Update used ring information for IOTLB to work correctly,
> > +     * vhost-kernel code requires for this.
> > +     */
> > +    r =3D vhost_device_iotlb_miss(dev, addr.used_user_addr, true);
> > +    if (unlikely(r !=3D 0)) {
> > +        /* Debug message already printed */
> > +        goto err;
> > +    }
> > +
> > +    return true;
> > +
> > +err:
> > +    vhost_virtqueue_start(dev, dev->vdev, &dev->vqs[idx], dev->vq_inde=
x + idx);
> > +    return false;
> > +}
> > +
> >   static int vhost_sw_live_migration_start(struct vhost_dev *dev)
> >   {
> >       int idx, stop_idx;
> > @@ -1249,24 +1335,35 @@ static int vhost_sw_live_migration_start(struct=
 vhost_dev *dev)
> >           }
> >       }
> >
> > +    dev->vhost_ops->vhost_set_vring_enable(dev, false);
> > +    if (vhost_backend_invalidate_device_iotlb(dev, 0, -1ULL)) {
> > +        error_report("Fail to invalidate device iotlb");
> > +    }
> > +
> >       /* Can be read by vhost_virtqueue_mask, from vm exit */
> >       qatomic_store_release(&dev->shadow_vqs_enabled, true);
> >       for (idx =3D 0; idx < dev->nvqs; ++idx) {
> > -        bool ok =3D vhost_shadow_vq_start(dev, idx, dev->shadow_vqs[id=
x]);
> > +        bool ok =3D vhost_sw_live_migration_start_vq(dev, idx);
> >           if (unlikely(!ok)) {
> >               goto err_start;
> >           }
> >       }
> >
> > +    /* Enable shadow vq vring */
> > +    dev->vhost_ops->vhost_set_vring_enable(dev, true);
> >       return 0;
> >
> >   err_start:
> >       qatomic_store_release(&dev->shadow_vqs_enabled, false);
> >       for (stop_idx =3D 0; stop_idx < idx; stop_idx++) {
> >           vhost_shadow_vq_stop(dev, idx, dev->shadow_vqs[stop_idx]);
> > +        vhost_virtqueue_start(dev, dev->vdev, &dev->vqs[idx],
> > +                              dev->vq_index + stop_idx);
> >       }
> >
> >   err_new:
> > +    /* Enable guest's vring */
> > +    dev->vhost_ops->vhost_set_vring_enable(dev, true);
> >       for (idx =3D 0; idx < dev->nvqs; ++idx) {
> >           vhost_shadow_vq_free(dev->shadow_vqs[idx]);
> >       }
> > @@ -1970,6 +2067,20 @@ void qmp_x_vhost_enable_shadow_vq(const char *na=
me, bool enable, Error **errp)
> >
> >           if (!hdev->started) {
> >               err_cause =3D "Device is not started";
> > +        } else if (!vhost_dev_has_iommu(hdev)) {
> > +            err_cause =3D "Does not support iommu";
> > +        } else if (hdev->acked_features & BIT_ULL(VIRTIO_F_RING_PACKED=
)) {
> > +            err_cause =3D "Is packed";
> > +        } else if (hdev->acked_features & BIT_ULL(VIRTIO_RING_F_EVENT_=
IDX)) {
> > +            err_cause =3D "Have event idx";
> > +        } else if (hdev->acked_features &
> > +                   BIT_ULL(VIRTIO_RING_F_INDIRECT_DESC)) {
> > +            err_cause =3D "Supports indirect descriptors";
> > +        } else if (!hdev->vhost_ops->vhost_set_vring_enable) {
> > +            err_cause =3D "Cannot pause device";
> > +        }
> > +
> > +        if (err_cause) {
> >               goto err;
> >           }
> >
>


