Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F69439915D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 19:20:17 +0200 (CEST)
Received: from localhost ([::1]:56410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loUXQ-0003vi-9U
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 13:20:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1loUWA-0003Bx-Bl
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 13:18:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1loUW6-0005uH-4L
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 13:18:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622654332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xovbcFW9Wm9BbkSEO13VkXeQ1uurzgptVRyNw1Dc8eQ=;
 b=QL8N6yUQRlCu2aEwzyfLVDS+SVtcZk3ulegLnhqg56QlvbLQBrD4BLer0KXPbM7Rxd+Lgf
 zLAIQrHL6ofGLJNqOITuCNGu4aqvKVd9DCJ3OwprMJjGzr1T0TyXRfk1Ha+qCjNwevgPZW
 vcWxF/iYabbVIqbT6I4ePh68G1mSsuI=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-IYYHcBU_NcCtRVjD8H6tzw-1; Wed, 02 Jun 2021 13:18:50 -0400
X-MC-Unique: IYYHcBU_NcCtRVjD8H6tzw-1
Received: by mail-lj1-f198.google.com with SMTP id
 w8-20020a05651c1028b02900f6e4f47184so935037ljm.5
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 10:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xovbcFW9Wm9BbkSEO13VkXeQ1uurzgptVRyNw1Dc8eQ=;
 b=cI/rwFBB2IUfBRIcJCB4qbhv6o5fOpmA1Cg2Vh0biz6sa0t66YrF4sfqlzuX/FFBwc
 E+S+fbxHEpx5lXezVzeFUOiS3Yfxa9xz8nihBqR3ekuEjPLqvukxnAmLXfNVjshkIF6s
 1f+wZr1jllMXAk3LqHjA5tGsaWON6qBRrXYAKYghmu6qDArcgStMAqhIGGMuHvlVfQxx
 suyEYlv+vnQUVf+75470luTrTFXL8EJlcPNAnicbFkPFPwLt/76DR3rUzWX7zm2/MYej
 qLfILWY5HZjcBV9mGdWQeBcF658wDymq4vZTh4whBqzjbp1vmbjX9ipFEQfsTuklkMhb
 AAhw==
X-Gm-Message-State: AOAM532G5LtiZrpg6bqSU6osOZI7bnPNNQ4TLpudG/qcpXwlDWBqawfX
 s7FWC9Nejnktbyhwm0VI+kdL8IwOyiPDRhHVX0BaRDU3wC4qmKxZm6geoddCi/2ThwDMbjPgDT9
 5xr6SZCo/a++1meIpW0mfzM8EgJev5hI=
X-Received: by 2002:a05:651c:211f:: with SMTP id
 a31mr25721897ljq.39.1622654328773; 
 Wed, 02 Jun 2021 10:18:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzi7Wpxw4ORbBF02lG/+qj81ez7J1opAAO9RkINC8UIoekJh+u2TR26jAefMDji3a0tQl0wOoQve1ckKrOrFo=
X-Received: by 2002:a05:651c:211f:: with SMTP id
 a31mr25721869ljq.39.1622654328470; 
 Wed, 02 Jun 2021 10:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210519162903.1172366-18-eperezma@redhat.com>
 <bfd680e5-9434-3fbe-3119-1f3c5fc42f4c@redhat.com>
In-Reply-To: <bfd680e5-9434-3fbe-3119-1f3c5fc42f4c@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 2 Jun 2021 19:18:10 +0200
Message-ID: <CAJaqyWf7M1fjrd+kr-2bcYj+ibrqZVoREZuTiJ0i+p6dA+Dukw@mail.gmail.com>
Subject: Re: [RFC v3 17/29] vhost: Shadow virtqueue buffers forwarding
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Harpreet Singh Anand <hanand@xilinx.com>,
 Xiao W Wang <xiao.w.wang@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 2, 2021 at 11:51 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/5/20 =E4=B8=8A=E5=8D=8812:28, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > Initial version of shadow virtqueue that actually forward buffers. The
> > exposed addresses are the qemu's virtual address, so devices with IOMMU
> > that does not allow full mapping of qemu's address space does not work
> > at the moment.
> >
> > Also for simplicity it only supports modern devices, that expects vring
> > in little endian, with split ring and no event idx or indirect
> > descriptors.
> >
> > It reuses the VirtQueue code for the device part. The driver part is
> > based on Linux's virtio_ring driver, but with stripped functionality
> > and optimizations so it's easier to review.
> >
> > Later commits will solve some of these concerns.
>
>
> It would be more more easier to review if you squash those
> "enhancements" into this patch.
>

Ok, they will be in the same commit for the next version.

>
> >
> > Code also need to map used ring (device part) as RW in, and only in,
> > vhost-net. To map (or call vhost_device_iotlb_miss) inconditionally
> > would print an error in case of vhost devices with its own mapping
> > (vdpa).
>
>
> I think we should not depend on the IOTLB miss. Instead, we should
> program the device IOTLB before starting the svq. Or is there anything
> that prevent you from doing this?
>

Sorry for being unclear, that is what I meant in the message: No other
device than kernel vhost needs the map (as "sent iotlb miss ahead"),
so we must make it conditional. Doing it unconditionally would make
nothing but an error appear on the screen, but it is incorrect anyway.

Is it clearer this way?

>
> > To know if this call is needed, vhost_sw_live_migration_start_vq and
> > vhost_sw_live_migration_stop copy the test performed in
> > vhost_dev_start. Testing for the actual backend type could be cleaner,
> > or checking for non-NULL vhost_force_iommu, enable_custom_iommu, or
> > another vhostOp. We could extract this test in its own function too,
> > so its name could give a better hint. Just copy the vhost_dev_start
> > check at the moment.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.c | 205 +++++++++++++++++++++++++++-=
-
> >   hw/virtio/vhost.c                  | 134 ++++++++++++++++++-
> >   2 files changed, 325 insertions(+), 14 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index ff50f12410..6d767fe248 100644
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
> > @@ -48,9 +49,93 @@ typedef struct VhostShadowVirtqueue {
> >
> >       /* Virtio device */
> >       VirtIODevice *vdev;
> > +
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
> > +    uint16_t flags =3D write ? cpu_to_le16(VRING_DESC_F_WRITE) : 0;
> > +    vring_desc_t *descs =3D svq->vring.desc;
> > +
> > +    if (num =3D=3D 0) {
> > +        return;
> > +    }
> > +
> > +    for (n =3D 0; n < num; n++) {
> > +        if (more_descs || (n + 1 < num)) {
> > +            descs[i].flags =3D flags | cpu_to_le16(VRING_DESC_F_NEXT);
> > +        } else {
> > +            descs[i].flags =3D flags;
> > +        }
> > +        descs[i].addr =3D cpu_to_le64((hwaddr)iovec[n].iov_base);
> > +        descs[i].len =3D cpu_to_le32(iovec[n].iov_len);
> > +
> > +        last =3D i;
> > +        i =3D cpu_to_le16(descs[i].next);
> > +    }
> > +
> > +    svq->free_head =3D le16_to_cpu(descs[last].next);
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
> > +    avail->ring[avail_idx] =3D cpu_to_le16(head);
> > +    svq->avail_idx_shadow++;
> > +
> > +    /* Expose descriptors to device */
>
>
> It's better to describe the detail order.
>
> E.g "Update avail index after the descriptor is wrote"
>

Agree, I will replace it with your wording.

>
> > +    smp_wmb();
> > +    avail->idx =3D cpu_to_le16(svq->avail_idx_shadow);
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
> > @@ -60,7 +145,67 @@ static void vhost_handle_guest_kick(EventNotifier *=
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
> > +            VirtQueueElement *elem =3D virtqueue_pop(svq->vq, sizeof(*=
elem));
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
> > +    svq->shadow_used_idx =3D cpu_to_le16(svq->vring.used->idx);
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
> > +    used_elem.id =3D le32_to_cpu(used->ring[last_used].id);
> > +    used_elem.len =3D le32_to_cpu(used->ring[last_used].len);
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
> > @@ -69,17 +214,33 @@ static void vhost_shadow_vq_handle_call_no_test(Ev=
entNotifier *n)
> >       VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowVirtqueu=
e,
> >                                                call_notifier);
> >       EventNotifier *masked_notifier;
> > +    VirtQueue *vq =3D svq->vq;
> >
> >       masked_notifier =3D svq->masked_notifier.n;
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
>
>
> Any reason that you don't use virtio_notify() here?
>

No reason but to make sure guest_notifier is used. I'm not sure if
this is an implementation detail though.

I can test to switch to virtio_notify, what would be the advantage here?

>
> > +        } else if (!svq->masked_notifier.signaled) {
> > +            svq->masked_notifier.signaled =3D true;
> > +            event_notifier_set(svq->masked_notifier.n);
> > +        }
>
>
> This is an example of the extra complexity if you do shadow virtqueue at
.> virtio level.
>
> If you do everything at e.g vhost-vdpa, you don't need to care about
> masked_notifer at all.
>

Correct me if I'm wrong, what you mean is to use the backend
vhost_set_vring_call to set the guest notifier (from SVQ point of
view), and then set it unconditionally. The function
vhost_virtqueue_mask would set the masked one by itself, no
modification is needed here.

Backend would still need a conditional checking if SVQ is enabled, so
it either sends call_fd to backend or to SVQ. The call to
virtqueue_fill, would still be needed if we don't want to duplicate
all the device virtio's logic in the vhost-vdpa backend.

Another possibility would be to just store guest_notifier in SVQ, and
replace it with masked notifier and back. I think this is more aligned
with what you have in mind, but it still needs changes to
vhost_virtqueue_mask. Note that the boolean store
masked_notifier.signaled is just a (maybe premature) optimization to
skip the unneeded write syscall, but it could be omitted for brevity.
Or maybe a cleaner solution is to use io_uring for this write? :).

Thanks!

> Thanks
>


